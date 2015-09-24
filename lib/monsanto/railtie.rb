require 'monsanto'
require 'rails'

module Monsanto
  class Railtie < Rails::Railtie
    railtie_name :monsanto

    rake_tasks do
      load "tasks/populate.rake"
      load "tasks/db.rake"
    end
  end
end