class UsersController < ApplicationController
	include SessionsHelper

	before_action :signed_in_user, 	only: [:edit, :update, :index]
	before_action :fitting_user,	only: [:edit, :update]
	before_action :is_admin,		only: [:destroy]

	def show
		@user = User.find(params[:id])
		#@user = current_user
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
		#@user = User.find(params[:id])
	end

	def update
		if @user.update_attributes(user_params)
			flash[:success] = "User information updated"
			sign_in @user
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User destroyed"
		redirect_to users_url
	end

	def index
		@users = User.paginate(page: params[:page]).per_page(10)
	end

	private

		def user_params
			params.require(:user).permit(
				:name, :email, :password, :password_confirmation)
		end

		# Before filters

		def signed_in_user
			unless signed_in?
				store_location
				redirect_to signin_url, notice: "Please sign in" 
			end
		end

		def fitting_user
			@user = User.find(params[:id])

			if not current_user?(@user)
				flash[:error] = "Boese!"
				redirect_to root_url
			end
		end

		def is_admin
			unless current_user.admin?
				flash[:error] = "boese boese"
				redirect_to root_url
			end

			redirect_to root_url if @user == current_user
		end
end