Rails.application.routes.draw do

  # Users
  delete '/user/destroy/:id' => 'users#destroy', as: 'admin_destroy_user'
  get '/invite/:invite_id', to: 'users/registrations#new', as: 'invite_golfer'
  devise_for :users,
             :path_prefix => '/devise',
             :controllers => { :registrations => "users/registrations" }
  scope "/auth" do
    resources :users
  end
  get '/profile', to: 'user#profile', as: 'view_profile'

  # Invites, Purchases
  resources :invites
  resources :purchases

  # Charges
  get '/quick_purchase/:product_id', to: 'charges#new', as: 'quick_purchase'
  resources :charges, only: [:new, :create]

  # Shopping Cart
  resources :shopping_carts, only: [:index, :destroy]
  get '/cart/add_product/:product_id', to: 'shopping_carts#add_product_to_cart', as: 'add_product_to_user_cart'

  # Groups
  # get 'groups/edit_group'
  # get '/edit_group/:user_id', to: 'groups#edit_group', as: 'edit_group'
  # get '/edit_user/:user_id', to: 'user#edit', as: 'edit_user'
  # match 'update_user', to: 'user#update', via: [:put], as: 'update_user'

  # Main
  get '/twenty_ten_gallery', to: 'main#twenty_ten_gallery'
  get '/twenty_fifteen_gallery', to: 'main#twenty_fifteen_gallery'
  get '/athan_gallery', to: 'main#athan_gallery'
  get '/about', to: 'main#about', as: 'about'
  get '/donate', to: 'main#donate', as: 'donate'
  get '/childrens_exhibit', to: 'main#childrens_exhibit', as: 'childrens_exhibit'
  get '/golf_tournament', to: 'main#golf_tournament', as: 'golf_tournament'
  get '/legacy', to: 'main#legacy', as: 'legacy'
  get '/supporters', to: 'main#supporters', as: 'supporters'

  # Admin
  get '/admin', to: 'admin#home', as: 'admin'

  # Home
  root to: 'main#home'
end
