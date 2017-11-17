lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'streaker/version'

# rubocop:disable Metrics/BlockLength
Gem::Specification.new do |spec|
  spec.name = 'streaker'
  spec.version = Streaker::VERSION
  spec.authors = ['Sunny Ripert']
  spec.email = ['sunny.ripert@kisskissbankbank.com']

  spec.summary = 'Access the Streak API'
  spec.description = ''
  spec.homepage = 'https://github.com/KissKissBankBank/streaker'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the
  # 'allowed_push_host' to allow pushing to a single host or delete this
  # section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # API Bindings to Streak
  spec.add_dependency 'streak-ruby', '>= 0.0.2', '< 1'

  # Record HTTP Interactions
  spec.add_development_dependency 'vcr', '~> 3.0'

  # Mock HTTP requests
  spec.add_development_dependency 'webmock', '~> 3.1'

  # A different console for debugging
  spec.add_development_dependency 'pry', '~> 0.11'

  spec.add_development_dependency 'bundler', '>= 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  # Ruby linter
  spec.add_development_dependency 'rubocop', '~> 0.51.0'
end
# rubocop:enable Metrics/BlockLength
