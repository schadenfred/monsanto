namespace 'db' do 

  namespace 'populate' do

    def satisfy_dependencies(dependencies)

      dependencies.each do |populator|
        Rake::Task["db:populate:development:#{populator}"].invoke
      end
    end

    def populators(environment_path)
      populators = []
      populator_paths = Dir.glob(environment_path + "*.populator.rb")
      populator_paths.each do |populator_path|
        populators << populator_path.split("/").last.split(".").first
      end
      populators
    end

    def ordered_populators(environment_path)
      dependency_hash = Monsanto::TsortableHash[]

      
      pops = populators(environment_path) 
      pops.each do |populator|
        klass = populator.classify.constantize
        parents = []
        klass.reflect_on_all_associations(:belongs_to).each do |parent|
          unless parent.options[:polymorphic]
            
            parents << parent.table_name.singularize.to_sym
            end 
          end
        dependency_hash[populator.singularize.to_sym] = parents
      end
      dependency_hash.tsort
    end
    
    environment_paths = Dir.glob("lib/tasks/populate/*/").split("/").last
    environment_paths.each do |environment_path|
      environment = environment_path.split("/").last
      unless ["support", "common"].include? environment
        namespace environment.to_sym do
          
          populators(environment_path).each do |populator|

            desc "Populate #{environment} db with #{populator} populator"
            task populator => :environment do 

              Rails.application.eager_load!
              populator_file = File.read("lib/tasks/populate/#{environment}/#{populator}.populator.rb")

              eval(populator_file)

            end
          end
        end
      
        desc "Populate #{environment} db"

        task environment.to_sym => :environment do 
          Rake::Task["db:drop"].invoke
          Rake::Task["db:create"].invoke
          Rake::Task["db:migrate"].invoke
          ordered_populators(environment_path).each do |populator|
            Rake::Task["db:populate:#{environment}:#{populator.to_s.pluralize}"].invoke
          end
        end
      end
    end
  end
end 