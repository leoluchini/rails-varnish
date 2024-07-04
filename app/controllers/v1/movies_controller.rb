# frozen_string_literal: true

class V1::MoviesController < ApplicationController
  before_action :set_cache_control_headers, only: %i[index]

  def index
    set_surrogate_header('movies', movies.map(&:resource_key))
    render locals: { movies: }
  end

  def show
    set_surrogate_header(movie.resource_key)
    render locals: { movie: }
  end

  def embed
    set_surrogate_header(movie.resource_key)
    render locals: { movie: }
  end

  private

  def movies
    @movies ||= Movie.all
  end

  def movie
    @movie ||= Movie.find(params[:id] || params[:movie_id])
  end
end
