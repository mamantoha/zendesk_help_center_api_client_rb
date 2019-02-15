require 'faraday_middleware'

module ZendeskAPI
  class Client
    # overwrite to follow redirections
    # https://github.com/zendesk/zendesk_api_client_rb/blob/master/lib/zendesk_api/client.rb
    def connection
      @connection ||= build_connection

      unless @connection.builder.handlers.include?(FaradayMiddleware::FollowRedirects)
        @connection.builder.use(FaradayMiddleware::FollowRedirects)
      end

      return @connection
    end
  end
end
