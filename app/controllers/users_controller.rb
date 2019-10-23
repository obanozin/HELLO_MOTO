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
	    redirect_to user_path(current_user)
		
	end
	def is_deleted
		binding.pry
	    @user = User.find(params[:id])
	    @user.update!(is_deleted: true)
	    redirect_to new_user_registration_path
	end
	def cancel
		@user = current_user
	end


private 
 def user_params
     params.require(:user).permit(:nickname,:user_name,:sex,:prefecture_id,:user_introduction,:profile_image,:age,:email, :is_deleted )
 end

end
