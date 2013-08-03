class SessionsController < ApplicationController
	protect_from_forgery with: :exception
	include SessionsHelper

	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			flash[:success] = "Welcome to the Sample App!"
			redirect_to user
		else
			flash.now[:error] = 'Invalid credentials'
			render 'new'
		end
	end

	def destroy
		sign_out
		flash.now[:success] = "Successfully signed out"
		render 'static_pages/home'
		# Eigentlich: redirect_to root_url
	end
end