Rails.application.routes.draw do
  get 'rooms/show'
  resources :moto_infos
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html





  resources :users
end
