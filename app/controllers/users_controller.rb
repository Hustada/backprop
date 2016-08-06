class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
			if @user.save
				flash[:notice] = "User successfully created"
				redirect_to root_path
			else
				render 'new'
			end
	end

	def show
	end

	def edit
	end

	def update
	end


	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end