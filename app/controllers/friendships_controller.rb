class FriendshipsController < ApplicationController
#  before_action :authenticate

#  @friendships = Friendship.all
#  @users = User.inverse_friends(:current_user)
  def index
    @user = current_user
    @friendships = Friendship.all
  end

  def create
  	@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
  	if @friendship.save
  		flash[:notice] = "Added friend."
  		redirect_to users_path
  	else
  		flash[:error] = "Unable to add friend."
  		render 'new'
  	end
  end

  def destroy
#    @friend = User.find(params[:user_id])
  	@friendship = current_user.friendships.find(params[:id]) #this supposed to find the friendship by the parameters friend_id. 
  	@friendship.delete
  	flash[:notice] = "Successfully removed (now former) friend."
  	redirect_to friendships_path
  end
end
