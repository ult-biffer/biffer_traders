require_relative "lib/biffer_traders/version"

Gem::Specification.new do |spec|
  spec.name        = "biffer_traders"
  spec.version     = BifferTraders::VERSION
  spec.authors     = ["Ult Biffer"]
  spec.email       = [""]
  spec.homepage    = "https://github.com/ult-biffer/biffer_traders"
  spec.summary     = "Summary of BifferTraders."
  spec.description = "Description of BifferTraders."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.3.3"
  spec.add_dependency "httpx", ">= 1.2.5"

  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "solargraph", ">= 0.50.0"
end
