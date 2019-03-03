Rails.application.routes.draw do

  # get 'whishlists/index'sssssqsd
  # get 'whishlists/new'
  # get 'whishlists/create'
devise_for :users
root to: 'events#index'



  resources :events do
    resources :whishlists
    resources :guests
    get "/dashboard", to: "events#dashboard", as: :dashboard
    get "/account", to: "events#account", as: :account
    get "/select_guest", to: "events#select_guest", as: :select_guest
    resources :baskets do
      get "/update_price", to: "baskets#update_price", as: :update_price
      patch "/updated_price", to: "baskets#updated_price", as: :updated_price
    end
  end


  # resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
