class MessagesController < ApplicationController

  def index
  end

  def create
    @channel = Channel.find(params[:channel_id])
    @message = @channel.messages.new(message_params)
    @message.user = current_user
    if @message.save
      ActionCable.server.broadcast 'messages',
        message: @message.content,
        username: @message.user.username
      head :ok
    else
      flash[:alert] = "There was a problem sending your message. Please try again."
      render 'channels#show'
    end
  end

private
  def message_params
    params.require(:message).permit(:channel_id, :content)
  end
end
