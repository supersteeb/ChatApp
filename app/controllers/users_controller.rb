class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = current_user
	end

	def create
		@user = User.create user_params
		if @user.persisted? #save
			session[:user_id] = @user.id 
			flash[:success] = "Registered successfully"
			redirect_to new_session_path
		else
			flash.now[:error] = "Error: #{@user.errors.full_messages.to_sentence}"
			render'new' #means will render new html.erb file
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)

	end
end
