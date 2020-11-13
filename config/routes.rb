Rails.application.routes.draw do
  get root 'horses#index'
  resources :horses,only:[:new,:create,:show]
  resources :races,only:[:new,:create]
  resources :plans,only:[:index,:new,:create,:show,:destroy]
end
