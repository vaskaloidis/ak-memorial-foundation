Rails.application.routes.draw do

  resources :invites
  devise_for :users, :controllers =>
      {
          :registrations => "users/registrations"
      }

  resources :purchases
  resources :charges
  resources :shopping_carts

  resources :products do
    resources :users do
      resource :shopping_carts
    end
  end

  get '/invite/:invite_id',
      to: 'users#users/registrations',
      as: 'invite_golfer'

  get '/quick_purchase/:product_id', to: 'charges#new', as: 'quick_purchase'

  get 'add_product/:product_id/to_user_cart/:user_id',
      to: 'shopping_carts#add_product_to_cart',
      as: 'add_product_to_user_cart'

  match 'add_donation', to: 'shopping_carts#add_donation_to_cart', via: [:post], as: 'add_donation'

  root to: 'main#home'

  get '/admin', to: 'main#admin', as: 'admin'

  get '/view_profile', to: 'main#profile', as: 'view_profile'

  get '/twenty_ten_gallery', to: 'main#twenty_ten_gallery'
  get '/twenty_fifteen_gallery', to: 'main#twenty_fifteen_gallery'
  get '/athen_gallery', to: 'main#athen_gallery'

  get '/about', to: 'main#about', as: 'about'
  get '/donate', to: 'main#donate', as: 'donate'
  get '/childrens_exhibit', to: 'main#childrens_exhibit', as: 'childrens_exhibit'
  get '/golf_tournament', to: 'main#golf_tournament', as: 'golf_tournament'
  get '/legacy', to: 'main#legacy', as: 'legacy'
  get '/sponsorships', to: 'main#sponsorships', as: 'sponsorships'
  get '/supporters', to: 'main#supporters', as: 'supporters'

  # get 'admin/quick_purchase_golfer_package'
  # get 'admin/quick_purchase_sponsorship'
  get '/admin/quick_purchase_golfer_package/:user_id', to: 'admin#quick_purchase_golfer_package', as: 'admin_quick_purchase_golfer_package'
  get '/admin/quick_purchase_sponsorship/:user_id', to: 'admin#quick_purchase_sponsorship', as: 'admin_quick_purchase_sponsorship'

  # mount Judge::Engine => '/judge'

end
