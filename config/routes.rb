Rails.application.routes.draw do
	devise_scope :user do
    	root :to => "devise/sessions#new"
	end

	devise_for :admins, skip: :all
	devise_scope :admin do
		get '/admin_login' => 'devise/sessions#new', as: :new_admin_session
		post 'login' => 'devise/sessions#create', as: :admin_session
		delete 'logout' => 'devise/sessions#destroy', as: :destroy_admin_session
		# get 'signup' => 'devise_invitable/registrations#new', as: :new_admin_registration
		# post 'signup' => 'devise_invitable/registrations#create', as: :admin_registration
		# get 'signup/cancel' => 'devise_invitable/registrations#cancel', as: :cancel_admin_registration
		# get 'admin' => 'devise_invitable/registrations#edit', as: :edit_admin_registration
		# patch 'admin' => 'devise_invitable/registrations#update', as: nil
		# put 'admin' => 'devise_invitable/registrations#update', as: :update_admin_registration
		# delete 'admin' => 'devise_invitable/registrations#destroy', as: :destroy_admin_registration
		get 'password' => 'devise/passwords#new', as: :new_admin_password
		post 'password' => 'devise/passwords#create', as: :admin_password
		get 'password/edit' => 'devise/passwords#edit', as: :edit_admin_password
		patch 'password' => 'devise/passwords#update'
		put 'password' => 'devise/passwords#update', as: :update_admin_password
	end
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