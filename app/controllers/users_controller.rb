class UsersController < ApplicationController
respond_to :html, :js

before_action :authenticate_user!

  def search
    if params[:search].present?
      @mentors = Mentor.search(params[:search], fields: [{name: :word_start}])
    else
      @mentors = Mentor.all
    end
  end

  def show
    @user = User.find(params[:id])
    @previous_conversation = Conversation.where(sender_id: current_user.id, recipient_id: @user.id)
    @previous_received = Conversation.where(recipient_id: current_user.id, sender_id: @user.id)
    if @previous_conversation.count > 0
      @conversation = @previous_conversation.last
    elsif @previous_received.count > 0
      @conversation = @previous_revieved.last
    else
      @conversation = Conversation.create!(sender_id: current_user.id, recipient_id: @user.id)
    end
    @message = @conversation.messages.build
    @messages = []
    @conversation.messages.each {|msg| @messages << msg unless msg.body == ""}
  end

end
