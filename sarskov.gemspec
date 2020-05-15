# frozen_string_literal: true

require_relative 'lib/sarskov/version'

Gem::Specification.new do |spec|
  spec.name          = 'sarskov'
  spec.version       = Sarskov::VERSION
  spec.authors       = ['Emmanuel Hayford']
  spec.email         = ['siawmensah@gmail.com']

  spec.summary       = 'Sarskov returns statistics on the COVID-19 pandemic in a JSON format.'
  spec.description   = 'Sarskov returns statistics on the COVID-19 pandemic in a JSON format.'
  spec.homepage      = 'https://github.com/siaw23/sarskov'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.4.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/siaw23/sarskov'
  spec.metadata['changelog_uri'] = 'https://github.com/siaw23/sarskov'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
