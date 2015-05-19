class PagesController < ApplicationController
  respond_to :html, :js

  def home
    @mentors = Mentor.all
    @user = User.new
    @game = Game.new
    @users = User.all
    @conversation = Conversation.new
    if current_user
      @messages = current_user.received_messages.where(:read => false).select('DISTINCT sender_id')
    end
  end

  def search
    if params[:search].present?
      @mentors = Mentor.search(params[:search])
    else
      @mentors = Mentor.all
    end
  end

  def about
  end

  def contact
  end

  def terms
  end
end
