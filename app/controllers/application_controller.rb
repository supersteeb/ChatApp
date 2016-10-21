class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate

  helper_method :current_user, :user_signed_in?

  def current_user
  	return @current_user if @current_user

  	if session[:user_id]
  		User.find_by_id session[:user_id]
  	end
  end


  def authenticate
    redirect_to new_session_path unless user_signed_in?
  end


  def user_signed_in?
    current_user != nil
  end


end
