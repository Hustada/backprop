require 'pry'

class SessionsController < ApplicationController
	protect_from_forgery with: :exception
	include SessionsHelper
	before_action :redirect_if_current_user, only: [:create]
	
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

	def third_party
		@user = User.find_or_create_from_auth_hash(auth_hash)
		session[:user_id] = @user.id
		redirect_to root_path
	end

	protected

	def auth_hash
		request.env['omniauth.auth']
	end
end