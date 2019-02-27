Rails.application.routes.draw do

  get 'whishlists/index'
  get 'whishlists/new'
  get 'whishlists/create'
devise_for :users
root to: 'events#index'

 get "events/:event_id/dashboard", to: "events#dashboard", as: :dashboard

 get "events/:event_id/select_guest", to: "events#select_guest", as: :select_guest


  resources :events do
    resources :whishlists
    resources :guests
    resources :baskets
  end


  # resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
