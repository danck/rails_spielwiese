class SessionsController < ApplicationController
	protect_from_forgery with: :exception
	include SessionsHelper

	def new
	end

	def create
		user = User.find_by(email: params[:email].downcase)
		if user && user.authenticate(params[:password])
			sign_in user
			redirect_back_or user
		else
			flash.now[:error] = 'Invalid credentials'
			render 'new'
		end
	end

	def destroy
		sign_out
		flash.now[:success] = "Successfully signed out"
		redirect_to root_url
		# Eigentlich: redirect_to root_url
	end
end