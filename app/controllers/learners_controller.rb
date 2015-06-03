class LearnersController < ApplicationController
respond_to :html, :js

before_action :authenticate_user!

  def show
    @learner = User.find(params[:id])
    @message = Message.new
  end

  def search
    if params[:search] != [""]
      @searched_learners = Learner.search(params[:search], fields: [{name: :word_start}])
    else
      @searched_learners = Learner.all
    end
  end

end
