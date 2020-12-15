$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spontan/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spontan"
  s.version     = Spontan::VERSION
  s.authors     = ["Juri Glass"]
  s.email       = ["juriglx@gmail.com"]
  s.homepage    = "https://github.com/juriglx/spontan"
  s.summary     = "Summary of Spontan."
  s.description = "Description of Spontan."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 5"

  s.add_development_dependency "sqlite3"
end
