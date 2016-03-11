require_relative 'lib/concourse-resource/rubygems/version'

Gem::Specification.new do |gem|
  gem.name          = 'concourse-resource-rubygems'
  gem.version       = ConcourseResource::RubyGems::VERSION
  gem.license       = 'Apache-2.0'
  gem.summary       = 'Concourse Resource for RubyGems'

  gem.author        = 'Chris Olstrom'
  gem.email         = 'chris@olstrom.com'
  gem.homepage      = 'https://github.com/colstrom/concourse-resource-rubygems'

  gem.files         = `git ls-files`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'concourse-fuselage', '~> 0.3', '>= 0.3.0'

  gem.add_development_dependency 'semver2', '~> 3.4', '>= 3.4.2'
end
