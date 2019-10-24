Rails.application.routes.draw do
	devise_scope :user do
    	root :to => "devise/sessions#new"
	end
    devise_for :admins
	devise_for :users
	get 'users/:id/myteam' => 'users#myteam'
	get 'users/:id/cancel' => 'users#cancel'
	put 'users/:id/is_deleted' => 'users#is_deleted'

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
	resources :admins, :admin_users, :admin_teams

	resources :rooms ,only:[:show]
	post "/room/create/:user_id" => "rooms#create" ,as:'room_create'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end