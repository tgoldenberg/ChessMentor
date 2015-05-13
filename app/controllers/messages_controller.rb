class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def new
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build message_params
    @message.save

  end

  private

  def message_params
    params.require(:message).permit(:body, :sender_id, :recipient_id, :conversation_id)
  end
end
