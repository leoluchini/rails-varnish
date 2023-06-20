# frozen_string_literal: true

class Movie < ApplicationRecord
  def resource_key
    "#{collection_key}_#{id}"
  end

  def collection_key
    self.class.table_name
  end

  def cache_invalidate!
    Varnish::Client.perform_ban_request!(resource_key)
  end
end
