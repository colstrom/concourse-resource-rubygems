Gem::Specification.new do |gem|
  tag = `git describe --tags --abbrev=0`.chomp

  gem.name          = 'concourse-resource-rubygems'
  gem.homepage      = 'https://github.com/colstrom/concourse-resource-rubygems'
  gem.summary       = 'Concourse Resource for RubyGems'

  gem.version       = "#{tag}"
  gem.licenses      = ['MIT']
  gem.authors       = ['Chris Olstrom']
  gem.email         = 'chris@olstrom.com'

  gem.cert_chain    = ['trust/certificates/colstrom.pem']
  gem.signing_key   = File.expand_path ENV.fetch 'GEM_SIGNING_KEY'

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = `git ls-files -z -- bin/*`.split("\x0").map { |f| File.basename(f) }
  gem.test_files    = `git ls-files -z -- {test,spec,features}/*`.split("\x0")

  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'concourse-fuselage', '~> 0.3',  '>= 0.3.0'
  gem.add_runtime_dependency 'gems',               '~> 0.8',  '>= 0.8.3'
  gem.add_runtime_dependency 'httparty',           '~> 0.13', '>= 0.13.7'
end
