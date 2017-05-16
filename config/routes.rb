Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  get '/' => 'home#index'

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :users, only: [ :show, :index ] do
    resources :teams
  end

  resources :teams do
    resources :channels
    resources :users
  end

  resources :channels do
    resources :messages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
