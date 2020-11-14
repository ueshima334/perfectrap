Rails.application.routes.draw do
  get root 'raps#index'
  resources :horses,only:[:index,:new,:create,:show]
  resources :races,only:[:new,:create]
  resources :plans,only:[:index,:new,:create,:show,:destroy]
end
