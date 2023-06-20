# frozen_string_literal: true

module V1
  class MoviesController < ApplicationController
    before_action :set_cache_control_headers, only: [:index, :show]

    def index
      @movies = Movie.all
      set_surrogate_header('movies', @movies.map(&:resource_key))
      render json: @movies
    end

    def show
      @movie = Movie.find(params[:id])
      set_surrogate_header(@movie.resource_key)
      render json: @movie
    end

    private

    def set_surrogate_header(*keys)
      response.headers['xkey'] = keys.join(' ')
    end
  end
end
