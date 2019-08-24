Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  root 'spots#index'
  get '/search', to: 'spots#search', as: 'map_search'
  get '/livehouses_search', to: 'spots#livehouse_search'
  resources :spots, only: [:create, :edit, :update, :index, :show]
  resources :livehouses
  post 'spots/:id/posts' => 'posts#create', as: 'posts_create'
  post 'posts/:id/edit' => 'posts#edit', as: 'posts_edit'
  resources :posts, only: [:show, :edit, :update, :destroy]
  get 'users/:id/check' => 'users#check', as:'check'
  resources :users
  resources :admins
end
