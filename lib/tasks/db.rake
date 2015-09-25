Dir[Rails.root.join("lib/tasks/populate/support/*.rb")].each {|f| require f}

require 'faker/stoked'
require 'faker/bloocher'
require 'monsanto/tsortable'


# task aliases

desc "Alias for db:populate:development"
task "db:populate" =>  ["db:populate:development"]




