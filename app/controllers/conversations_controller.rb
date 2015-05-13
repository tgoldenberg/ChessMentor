class ConversationsController < ApplicationController
  respond_to :html, :js

  def show
    @conversation = Conversation.find(params[:id])
  end
end
