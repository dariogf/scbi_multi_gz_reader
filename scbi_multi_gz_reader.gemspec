# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scbi_multi_gz_reader/version'

Gem::Specification.new do |spec|
  spec.name          = "scbi_multi_gz_reader"
  spec.version       = ScbiMultiGzReader::VERSION
  spec.authors       = ["dariogf"]
  spec.email         = ["dariogf@scbi.uma.es"]
  spec.summary       = %q{Reads gz files with multiple streams in ruby}
  spec.description   = %q{Wrapper to read gz files composed of multiple gz streams (eg, made by doing a cat to join some gz files in a bigger one.)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
