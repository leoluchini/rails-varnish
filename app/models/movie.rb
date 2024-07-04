# frozen_string_literal: true

class Movie < ApplicationRecord
  include Cacheable
end
