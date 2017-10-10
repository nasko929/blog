class UsersController < ApplicationController
	def new
		
	end
	def index
		@users = User.all
	end
	def create  
		@user = User.new(params.require(:user).permit(:username, :password))
	 	if @user.save
	  		redirect_to action: 'index'
	  	else
	  		render 'new'
	  	end
	end
end