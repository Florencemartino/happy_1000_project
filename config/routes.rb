Rails.application.routes.draw do
  get 'event/new'
  get 'event/create'
  get 'event/edit'
  get 'event/update'
  get 'event/dashboard'
  get 'event/account'
  get 'event/destroy'
  devise_for :users
  root to: 'pages#home'

  resources :events do
    resources :whishlists
    resources :guests
    resources :baskets
  end


  # resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
