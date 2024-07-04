# frozen_string_literal: true

class EncoderUnlessEsiTag < ActiveSupport::JSON::Encoding.json_encoder
  def jsonify(value)
    value.is_a?(EsiTag) ? value : super(value)
  end
end
