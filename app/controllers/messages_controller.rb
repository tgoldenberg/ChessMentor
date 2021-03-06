class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def show
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.find(params[:id])
  end
  def new
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build message_params
    @message.avatar_url = current_user.avatar.url
    @message.save
    num = @message.recipient_id.to_s
    channel = 'private-conversation.' + num
    Pusher.trigger(channel, 'new_message', {:from => current_user.name, :avatar_url => @message.avatar_url, :message => @message.body, :conversation_id => @conversation.id, :create_time => @message.created_at})
  end

  private

  def message_params
    params.require(:message).permit(:body, :sender_id, :recipient_id, :conversation_id, :avatar_url)
  end
end
