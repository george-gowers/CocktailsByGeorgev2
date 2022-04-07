Rails.application.routes.draw do
  root to: 'cocktails#new'

  resources :cocktails, only: [:create]

end
