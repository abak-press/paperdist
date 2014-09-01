# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperdist/version'

Gem::Specification.new do |spec|
  spec.name          = "paperdist"
  spec.version       = Paperdist::VERSION
  spec.authors       = ["Nikolay Kondratyev"]
  spec.email         = ["nkondratyev@yandex.ru"]
  spec.description   = %q{Distributable paperclip attachments}
  spec.summary       = %q{Distributable paperclip attachments}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 3.0"
  spec.add_dependency "activerecord", ">= 3.0"
  spec.add_dependency "apress-paperclip"
  spec.add_dependency "apress-paperclip-webdav"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
