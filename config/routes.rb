Rails.application.routes.draw do
  resources :team_members, :teams,:moto_infos,:users
  resources :rooms ,only:[:show]
  post "/room/create/:user_id" => "rooms#create" ,as:'room_create'
  devise_for :users
  get 'request' => 'team_members#request'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
