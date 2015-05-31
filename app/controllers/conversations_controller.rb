class ConversationsController < ApplicationController
  respond_to :html, :js

  def show
    @conversation = Conversation.find(params[:id])
    @other_person = @conversation.sender_id == current_user.id ? @conversation.recipient : @conversation.sender
    @messages = @conversation.messages.all.order("created_at ASC").first(20)
    @conversation.messages.where(:recipient_id => current_user.id).each do |msg|
      msg.read = true
      msg.save
    end
    @message = Message.new
  end

  def new
    @previous_sent = Conversation.where(sender_id: params[:sender_id], recipient_id: params[:recipient_id])
    @previous_received = Conversation.where(sender_id: params[:recipient_id], recipient_id: params[:sender_id])
    if @previous_sent.count > 0
      @conversation = @previous_sent.last
    elsif @previous_received.count > 0
      @conversation = @previous_received.last
    else
      @conversation = Conversation.create!(sender_id: params[:sender_id], recipient_id: params[:recipient_id])
    end

    redirect_to @conversation
  end

end
