class UsersController < ApplicationController
	def new
		
	end
	def show
		
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
	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to action: 'index'
	end
end