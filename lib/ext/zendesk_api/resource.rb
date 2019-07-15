module ZendeskAPI
  class Data
    # revert https://github.com/zendesk/zendesk_api_client_rb/pull/361
    # This breaks create Article Translation
    remove_method :respond_to_missing?
  end
end
