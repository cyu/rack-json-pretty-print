# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/json_pretty_print/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-json-pretty-print"
  spec.version       = Rack::JSONPrettyPrint::VERSION
  spec.authors       = ["Calvin Yu"]
  spec.email         = ["me@sourcebender.com"]
  spec.summary       = %q{Rack middleware that will optionally format JSON responses}
  spec.description   = %q{Rack middleware that will pretty print JSON response when pretty=1 is passed as a web parameter}
  spec.homepage      = "http://github.com/cyu/rack-json-pretty-print"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rack", ">= 1.0.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
