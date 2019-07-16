require File.expand_path('lib/zendesk_api/help_center/version', __dir__)

Gem::Specification.new do |spec|
  spec.name          = 'zendesk_help_center_api'
  spec.version       = ZendeskAPI::HelpCenter::VERSION
  spec.license       = 'Apache-2.0'
  spec.authors       = ['Anton Maminov']
  spec.email         = ['anton.maminov@gmail.com']

  spec.summary       = 'Zendesk Help Center REST API Client'
  spec.description   = 'Ruby wrapper for the REST API at http://www.zendesk.com. Documentation at https://developer.zendesk.com/rest_api/docs/help_center/introduction.'
  spec.homepage      = 'https://github.com/mamantoha/zendesk_help_center_api_client_rb'

  spec.required_ruby_version = '>= 2.3.0'

  spec.files = `git ls-files`.split("\n")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'zendesk_api', '~> 1.19.0'
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.13'

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'pry', '~> 0.12'
  spec.add_development_dependency 'rake', '~> 12.0'
end
