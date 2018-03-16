Rails.application.routes.draw do
  root to: 'main#home'

  #   devise_for :users
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  get '/gallery', to: 'main#gallery'
  get '/gallery_second', to: 'main#gallery_second'

  get '/about', to: 'main#about', as: 'about'
  get '/childrens_exhibit', to: 'main#childrens_exhibit', as: 'childrens_exhibit'
  get '/golf_tournament', to: 'main#golf_tournament', as: 'golf_tournament'
  get '/legacy', to: 'main#legacy', as: 'legacy'
  get '/sponsorships', to: 'main#sponsorships', as: 'sponsorships'
  get '/supporters', to: 'main#supporters', as: 'supporters'


end
