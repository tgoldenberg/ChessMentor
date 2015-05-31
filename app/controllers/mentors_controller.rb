class MentorsController < ApplicationController
respond_to :html, :js

before_action :authenticate_user!

  def show
    @mentor = User.find(params[:id])
    @message = Message.new
  end
end
