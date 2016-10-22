class MessagesController < ApplicationController
  def index
  #@messages = User.where(:user_id => current_user.id).order("created_at DESC") #trying to if current_user is user logged in, then view only messages in which current_user is recipient. 
  @messages = Message.all.order('created_at desc')
  end

  def new
    @message = Message.new
    @user = current_user
    @recipients = User.all
    @users = User.all
  end

  def create
  	@user = User.find(params[:user_id])
  	@message = Message.sent_messages.build message_params
  #  @message.sender_id = current_user

  	if @messages.save
      flash[:success] = "Message Sent!"
      redirect_to received_user_messages_path
  	else
  		flash[:alert] = "Great Scott!"
      render 'new'
  	end
  end

  def show
  	@message = Message.find(params[:id])
  	if @message.read? && current_user == @message.recipient
  		@message.mark_as_read!
  	end
  end

  def sent
  	load_user
  	@messages = @user.sent_messages
  end

  def received
  	load_user
  	@messages = @user.received_messages.order("created_at DESC")
  end

  def load_user
  	if params[:user_id]
  		@user = User.find params[:user_id]
  	else
  		@user = current_user
  	end
  end

  def mark_as_read!
    self.read_at = Time.now
    save!
  end

  def read?
    read_at
  end


  private
  
  def message_params
  	params.require(:message).permit(:recipient_id, :body)
  end


end
