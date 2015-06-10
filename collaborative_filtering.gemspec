# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'collaborative_filtering/version'

Gem::Specification.new do |spec|
  spec.name          = 'collaborative_filtering'
  spec.version       = CollaborativeFiltering::VERSION
  spec.authors       = ['Shoya TANAKA']
  spec.email         = ['8398a7@gmail.com']

  spec.summary       = %q{collaborative filtering calculator.}
  spec.description   = %q{It provides you easy way to calculate collaborative filtering using pearson correlation coefficient.}
  spec.homepage      = 'https://github.com/8398a7/collaborative_filtering'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
end
