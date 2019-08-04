Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'spots#index'
  get '/search', to: 'spots#search', as: 'map_search'
  resources :spos, only: [:new, :create, :edit, :update, :index, :show]

end
