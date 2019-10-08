class UsersController < ApplicationController


	def show
		@user = User.find(params[:id])

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
    redirect_to user_path(current_user)
		
	end

private 
 def user_params
     params.require(:user).permit(:nickname,:user_name,:sex,:prefecture_id,:user_introduction,:profile_image,:age,:email )
 end

end
