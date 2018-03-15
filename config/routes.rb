Rails.application.routes.draw do
  root to: 'main#home'

  #   devise_for :users
  devise_for :users, controllers: {
      sessions: 'users/sessions'
  }

  get '/gallery', to: 'main#gallery'
  get '/gallery_second', to: 'main#gallery_second'

end
