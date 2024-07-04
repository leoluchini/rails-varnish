# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :v1 do
    resources :lists, only: :index
    resources :movies, only: %i[index show] do
      get :embed
    end
  end
end
