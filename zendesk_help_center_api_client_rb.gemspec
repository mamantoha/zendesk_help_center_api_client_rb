# coding: utf-8
# lib = File.expand_path('../lib', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "zendesk_help_center_api"
  spec.version       = '0.0.1'
  spec.authors       = ["Anton Maminov"]
  spec.email         = ["anton.linux@gmail.com"]

  spec.summary       = %q{Zendesk Help Center REST API Client}
  spec.description   = %q{Ruby wrapper for the REST API at http://www.zendesk.com. Documentation at https://developer.zendesk.com/rest_api/docs/help_center/introduction.}
  spec.homepage      = "https://github.com/mamantoha/zendesk_help_center_api_client_rb"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = [
    "README.md",
    "lib/zendesk_api/help_center.rb",
  ]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "zendesk_api"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "byebug"
end
