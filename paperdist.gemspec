# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperdist/version'

Gem::Specification.new do |spec|
  spec.metadata['allowed_push_host'] = 'https://gems.railsc.ru'
  spec.name          = 'paperdist'
  spec.version       = Paperdist::VERSION
  spec.authors       = ['Nikolay Kondratyev']
  spec.email         = ['nkondratyev@yandex.ru']
  spec.description   = %q{Distributable paperclip attachments}
  spec.summary       = %q{Distributable paperclip attachments}
  spec.homepage      = 'https://github.com/abak-press/paperdist'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rails', '>= 3.1.12', '< 4.2'
  spec.add_runtime_dependency 'paperclip', '>= 4.0', '< 4.4'
  spec.add_runtime_dependency 'apress-paperclip-webdav', '~> 1.0'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 3.0'
  spec.add_development_dependency 'appraisal', '>= 1.0.2'
  spec.add_development_dependency 'simplecov'
end
