class PagesController < ApplicationController
  respond_to :html, :js

  def home
    @mentors = Mentor.all
    @user = User.new
    @users = User.all
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
