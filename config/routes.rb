Rails.application.routes.draw do

  resources :rooms ,only:[:show]
  post "/room/create/:user_id" => "rooms#create" ,as:'room_create'
  resources :teams
  resources :moto_infos
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html





  resources :users
end
