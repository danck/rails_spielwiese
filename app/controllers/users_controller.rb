class UsersController < ApplicationController
	include SessionsHelper

	def show
		#@user = User.find_by(id: params[:id])
		@user = current_user
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = "Welcome to Fruchtfabrik"
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			@user.save
			flash[:success] = "User information updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	private

		def user_params
			params.require(:user).permit(
				:name, :email, :password, :password_confirmation)
		end
end