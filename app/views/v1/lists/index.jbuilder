# frozen_string_literal: true

json.collection lists do |list|
  json.extract! list, :id, :title
  json.items esi_collection(list.movies)
end
