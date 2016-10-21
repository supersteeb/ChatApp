class FriendshipsController < ApplicationController
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
  	@friendship = Friendship.find(params[:id])
  	@friendship.destroy
  	flash[:notice] = "Successfully removed friend."
  	redirect_to users_path
  end
end
