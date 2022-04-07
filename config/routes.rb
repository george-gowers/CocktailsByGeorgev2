Rails.application.routes.draw do
  root to: 'cocktails#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get 'mail', to: 'cocktails#mail'

  resources :cocktails, only: [:create]

  get '/cocktails/not_valid', to: 'cocktails#not_valid'

  get '/cocktails/email_not_valid', to: 'cocktails#mail_not_valid'

end
