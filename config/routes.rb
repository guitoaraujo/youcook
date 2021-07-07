Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'recipes#index'

  resources :recipes, only: %i[index show]
end
