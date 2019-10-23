class AdminTeamsController < ApplicationController
before_action :authenticate_admin!
	PER = 10
	def index
		@teams = Team.page(params[:page]).per(PER)
	end
end
