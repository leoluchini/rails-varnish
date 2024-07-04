# frozen_string_literal: true

class ApplicationController < ActionController::API
  helper EsiHelper

  def set_surrogate_header(*keys)
    response.headers['xkey'] = keys.join(' ')
  end

  def set_cache_control_headers(max_age = 5.minutes)
    # removes session data
    request.session_options[:skip] = true
    response.headers['Surrogate-Control'] = "max-age=#{max_age}"
    response.headers['Cache-Control'] = 'public, no-cache'
  end
end
