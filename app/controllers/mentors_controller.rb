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
    @mentor = Mentor.find(params[:id])
  end

end
