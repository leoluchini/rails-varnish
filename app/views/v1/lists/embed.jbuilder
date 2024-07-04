# frozen_string_literal: true

json.extract! list, :id, :title
json.items esi_collection(list.movies)
