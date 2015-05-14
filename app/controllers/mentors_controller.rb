class MentorsController < ApplicationController
respond_to :html, :js

before_action :authenticate_user!

  def search
    if params[:search].present?
      @mentors = Mentor.search(params[:search], fields: [{name: :word_start}])
    else
      @mentors = Mentor.all
    end
  end

  def highest_ranked
    @mentors = Mentor.all.order("official_ranking DESC")
  end

  def lowest_price
    @mentors = Mentor.all.order("fee ASC")
  end

  def best_user_ranking
    @mentors = Mentor.all.order("user_ranking DESC")
  end

  def show
    @mentor = User.find(params[:id])
    @previous_conversation = Conversation.where(sender_id: current_user.id, recipient_id: @mentor.id)
    @previous_received = Conversation.where(recipient_id: current_user.id, sender_id: @mentor.id)
    if @previous_conversation.count > 0
      @conversation = @previous_conversation.last
    elsif @previous_received.count > 0
      @conversation = @previous_received.last
    else
      @conversation = Conversation.create!(sender_id: current_user.id, recipient_id: @mentor.id)
    end
    @message = @conversation.messages.build
    @messages = []
    @conversation.messages.each {|msg| @messages << msg unless msg.body == ""}
  end

end
