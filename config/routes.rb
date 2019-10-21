Rails.application.routes.draw do
	devise_for :users

	resources :teams do
		resources :team_members
		get 'people' => 'team_members#people', as: 'people'
        resources :tourings do
        	resources :touring_members
        end
    end
		# get 'teams/:team_id/team_members/:id/people' => 'team_members#people'
	# get 'teams/:team_id/team_members/:id/people' => 'team_members#people',as: ''

	resources :moto_infos
	resources :users

	resources :rooms ,only:[:show]
	post "/room/create/:user_id" => "rooms#create" ,as:'room_create'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end