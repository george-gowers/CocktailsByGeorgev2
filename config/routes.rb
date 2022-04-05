Rails.application.routes.draw do
  root to: 'cocktails#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get 'mail', to: 'cocktails#mail'

  resources :cocktails, only: [:create]

end
