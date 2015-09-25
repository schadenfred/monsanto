require "monsanto/version"

module Monsanto
  require 'monsanto/railtie' if defined?(Rails)
  require "monsanto/rake_colorizer.rb"
  require "monsanto/rake_prettifier.rb"
  require "monsanto/tsortable.rb"

end
