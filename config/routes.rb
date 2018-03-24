Rails.application.routes.draw do

  resources :purchases
  devise_for :users

  resources :charges
  resources :shopping_carts

  resources :products do
    resources :users do
      resource :shopping_carts
    end
  end


  get 'add_product/:product_id/to_user_cart/:user_id',
        to: 'shopping_carts#add_product_to_cart',
        as: 'add_product_to_user_cart'

  match 'add_donation', to: 'shopping_carts#add_donation_to_cart', via: [:post]

  root to: 'main#home'

  get '/admin', to: 'main#admin', as: 'admin'

  get '/view_profile', to: 'main#profile', as: 'view_profile'

  get '/twenty_ten_gallery', to: 'main#twenty_ten_gallery'
  get '/twenty_fifteen_gallery', to: 'main#twenty_fifteen_gallery'
  get '/athen_gallery', to: 'main#athen_gallery'

  get '/about', to: 'main#about', as: 'about'
  get '/childrens_exhibit', to: 'main#childrens_exhibit', as: 'childrens_exhibit'
  get '/golf_tournament', to: 'main#golf_tournament', as: 'golf_tournament'
  get '/legacy', to: 'main#legacy', as: 'legacy'
  get '/sponsorships', to: 'main#sponsorships', as: 'sponsorships'
  get '/supporters', to: 'main#supporters', as: 'supporters'


end
