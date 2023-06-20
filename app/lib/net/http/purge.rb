# frozen_string_literal: true

require 'net/http'

module Net
  module Http
    class Purge < Net::HTTP::Get
      METHOD = 'PURGE'
      REQUEST_HAS_BODY = false
      RESPONSE_HAS_BODY = true
    end
  end
end
