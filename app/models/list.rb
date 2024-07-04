# frozen_string_literal: true

class List < ApplicationRecord
  include Cacheable

  has_many :list_items, dependent: :destroy, inverse_of: :list
  has_many :movies, through: :list_items
end
