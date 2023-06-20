# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :v1 do
    resources :movies, only: [:index, :show], defaults: { format: 'json' }
  end
end
