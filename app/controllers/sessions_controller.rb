class SessionsController < ApplicationController
	protect_from_forgery with: :exception
	include SessionsHelper 

def new
end

def create
	user = User.find_by(email: params[:session][:email].downcase)
	if user && user.authenticate(params[:session][:password])
		log_in user
		remember user
		params[:session][:remember_me] == '1' ? remember(user) : forget(user)
		flash[:notice] = "Successfully logged in"
		redirect_to root_path
	else
		flash[:notice] = "Invalid email/password combination"
		render 'new'
	end
end

def destroy
	log_out if logged_in?
	flash[:notice] = "You have been logged out"
	redirect_to root_path
end

end