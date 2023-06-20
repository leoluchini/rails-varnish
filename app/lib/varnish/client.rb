# frozen_string_literal: true

require 'net/http'

module Varnish
  class Client
    def self.perform_ban_request!(surrogate_keys)
      http = Net::HTTP.new('localhost', '8080')
      request = Net::Http::Purge.new('localhost:8080', { 'X-Xkey-Purge' => surrogate_keys })
      http.request(request)
    end
  end
end
