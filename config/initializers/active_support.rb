# frozen_string_literal: true

Rails.application.config.to_prepare do
  ActiveSupport.json_encoder = EncoderUnlessEsiTag
  ActiveSupport.escape_html_entities_in_json = false
end
