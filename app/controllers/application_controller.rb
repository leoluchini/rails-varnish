# frozen_string_literal: true

class ApplicationController < ActionController::API
  def set_cache_control_headers(max_age = 1.day)
    # removes session data
    request.session_options[:skip] = true
    response.headers['Surrogate-Control'] = "max-age=#{max_age}"
    response.headers['Cache-Control'] = 'public, no-cache'
  end
end
