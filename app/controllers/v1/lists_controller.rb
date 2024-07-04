# frozen_string_literal: true

class V1::ListsController < ApplicationController
  before_action :set_cache_control_headers, only: %i[index embed]

  def index
    set_surrogate_header('lists')
    render locals: { lists: }
  end

  def embed
    set_surrogate_header(list.resource_key)
    render locals: { list: }
  end

  private

  def lists
    @lists ||= List.all
  end

  def list
    @list ||= List.find(params[:list_id])
  end
end
