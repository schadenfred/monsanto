# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monsanto/version'

Gem::Specification.new do |spec|
  spec.name          = "monsanto"
  spec.version       = Monsanto::VERSION
  spec.authors       = ["schadenfred"]
  spec.email         = ["fred.schoeneman@gmail.com"]

  spec.summary       = %q{Populate your database.}
  spec.description   = %q{Similar to Seedbank, but with automatic dependency sorting and, as of now, no tests. Your Mileage may vary.}
  spec.homepage      = "https://github.com/schadenfred/monsanto.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
