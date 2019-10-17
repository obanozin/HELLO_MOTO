Rails.application.routes.draw do
	devise_for :users

	resources :teams do
		resources :team_members
	end
	resources :moto_infos
	resources :users

	resources :rooms ,only:[:show]
	post "/room/create/:user_id" => "rooms#create" ,as:'room_create'
	get 'request' => 'team_members#request'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
