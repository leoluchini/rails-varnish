# frozen_string_literal: true
# https://varnish-cache.org/docs/trunk/users-guide/esi.html#what-happens-when-it-fails

module EsiHelper
  # Helper to generate ESI (Edge Side Includes) tag with the given source.
  #
  # @param src [String] The URL to include in the ESI tag.
  # @return [String] A string containing the generated ESI tag.
  #
  def esi_for(src:)
    EsiTag.new "<esi:include src='#{src}' onerror='continue' />"
  end

  def esi_collection(collection)
    collection.map { |item| esi_for(src: embed_path_for(item)) }
  end

  private

  def embed_path_for(resource)
    polymorphic_path([:v1, resource, :embed])
  end
end
