# frozen_string_literal: true

class V1::ListsController < ApplicationController
  before_action :set_cache_control_headers, only: [:index]

  def index
    set_surrogate_header('lists', lists.map(&:resource_key))
    render locals: { lists: }
  end

  private

  def lists
    @lists ||= List.all
  end
end
