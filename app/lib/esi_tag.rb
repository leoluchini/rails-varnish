# frozen_string_literal: true

class EsiTag
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_json(*)
    value
  end

  # def as_json(*)
  #   self
  # end

  def respond_to?(method, *args)
    return false if method.to_s == 'as_json'

    super
  end
end
