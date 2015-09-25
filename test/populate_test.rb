require 'test_helper'

describe "TaskTest" do

  describe "db" do 

    describe "populate" do 

      describe "development" do 

        it "must be a task" do 
          subject.class.must_equal Rake::Task
        end

        describe "addresses" do 

          it "must be a task" do 
            subject.class.must_equal Rake::Task
          end
        end
      end
    end
  end
end
