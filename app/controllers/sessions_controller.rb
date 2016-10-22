class SessionsController < ApplicationController
  
  skip_before_action :authenticate, only: [:new, :create]

  def new
    redirect_to user_path(:id) if user_signed_in? and return
  end

  def destroy
  	session[:user_id] = nil
  	flash[:success] = "Logged out."

  	redirect_to root_path
  end

  def create
  	if @user = User.find_by(email: params[:email]) and @user.authenticate(params[:password])
  			session[:user_id] = @user.id
  			redirect_to user_messages_path(:id), flash: {success: "Logged In"}
  		else
  			flash.now[:error] = "Invalid username or password."
  			render 'new'
  		end
  end

end
