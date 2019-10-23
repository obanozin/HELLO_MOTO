class AdminUsersController < ApplicationController
before_action :authenticate_admin!
	def index
		@user = User.all
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
	    @user = User.find(params[:id])
	    @user.update(user_params)
	    redirect_to admins_path
	end



	private
	def user_params
	    params.require(:user).permit(:is_deleted)
	end
end
