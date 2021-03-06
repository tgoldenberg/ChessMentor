class MentorsController < ApplicationController
respond_to :html, :js

before_action :authenticate_user!

  def show
    @mentor = User.find(params[:id])
    @message = Message.new
  end

  def search
    if params[:search] != [""]
      @searched_mentors = Mentor.search(params[:search], fields: [{name: :word_start}])
    else
      @searched_mentors = Mentor.all
    end
  end

end
