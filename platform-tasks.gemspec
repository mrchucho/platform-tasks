# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'platform/tasks/version'

Gem::Specification.new do |spec|
  spec.name          = 'platform-tasks'
  spec.version       = Platform::Tasks::VERSION
  spec.authors       = ['Ralph Churchill']
  spec.email         = ['ralph.churchill@vitals.com']
  spec.description   = %q{Common Platform tasks}
  spec.summary       = %q{Include rake tasks for development setup and CI}
  spec.homepage      = 'https://github.com/mrchucho/platform-tasks'
  spec.license       = 'MIT'

  spec.files         = [
    '.rubocop-platform.yml',
    '.rubocop.yml',
    'Gemfile',
    'README.md',
    'Rakefile',
    'lib/platform/tasks.rb',
    'lib/platform/tasks/ci.rake',
    'lib/platform/tasks/cop.rake',
    'lib/platform/tasks/setup.rake',
    'lib/platform/tasks/version.rb',
    'rubocop-todo.yml',
  ]
  spec.executables   = []
  spec.test_files    = []
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_dependency 'rails', '~> 4.0.0'
  spec.add_dependency 'rubocop'
  spec.add_dependency 'rubocop-checkstyle_formatter'
end
