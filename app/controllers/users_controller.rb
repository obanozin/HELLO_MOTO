class UsersController < ApplicationController


	def show
		@user = User.find(params[:id])
		@moto_infos = @user.moto_infos

		# @prefecture = Prefecture.find(params[:id])
		# @prefectures = @user.prefectures
	end
	def edit
	    @user = User.find(params[:id])
	  if @user.id != current_user.id
	     redirect_to user_path(current_user)
	 end
	end

	def update
	    @user = User.find(params[:id])
	    @user.update(user_params)
	    if admin_signed_in?
	    	redirect_to admins_path
	    else
	        redirect_to user_path(current_user)
	    end
		
	end
	def myteam
		@user = User.find(params[:id])
		@myteam = @user.team_members.approval
		@myteams = @user.team_members.hold

	end
	def cancel
		@user = current_user
	end


private 
 def user_params
     params.require(:user).permit(:nickname,:user_name,:sex,:prefecture_id,:user_introduction,:profile_image,:age,:email, :is_deleted )
 end

end
