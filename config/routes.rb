Rails.application.routes.draw do
  devise_for :users
  root to: 'main#home'

  get '/gallery', to: 'main#gallery'
  get '/gallery_second', to: 'main#gallery_second'

end
