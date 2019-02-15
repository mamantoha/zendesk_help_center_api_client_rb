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

  spec.required_ruby_version = '>= 2.2.0'

  spec.files = [
    'README.md',
    'lib/ext/zendesk_api/client.rb',
    'lib/zendesk_api/help_center.rb',
    'lib/zendesk_api/help_center/version.rb'
  ]
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'zendesk_api'
  spec.add_runtime_dependency 'faraday_middleware'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
end
