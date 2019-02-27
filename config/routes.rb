Rails.application.routes.draw do

  devise_for :users
  root to: 'event#index'
 get "events/:event_id/dashboard", to: "reviews#dashboard", as: :dashboard
  resources :events do
    resources :whishlists
    resources :guests
    resources :baskets
  end


  # resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
