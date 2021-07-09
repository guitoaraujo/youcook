# frozen_string_literal: true

Rails.application.routes.draw do
  root 'recipes#index'

  resources :recipes, only: %i[index show]
  namespace :api do
    namespace :v1 do
      resources :recipes, only: %i[index show]
    end
  end
end
