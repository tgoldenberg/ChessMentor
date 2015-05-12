class UsersController < ApplicationController
respond_to :html, :js

before_action :authenticate_user!

  def search
    if params[:search].present?
      @users = User.search(params[:search], fields: [{name: :word_start}])
    else
      @users = User.all
    end
  end

  def highest_ranked
    @users = User.all.order("official_ranking DESC")
  end

  def lowest_price
    @users = User.all.order("fee ASC")
  end

  def best_user_ranking
    @users = User.all.order("user_ranking DESC")
  end

  def show
    @user = User.find(params[:id])
    @request = Request.new
  end

end
