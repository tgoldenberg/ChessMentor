class InvitationsController < ApplicationController
  respond_to :html, :js

  def show
    @invitation = Invitation.find(params[:id])
  end

  def create
    @invitation = Invitation.new
    @invitation.sender_id = params[:sender_id]
    @invitation.recipient_id = params[:recipient_id]
    @invitation.save
    # redirect_to root_url, notice: 'Invitation sent to ' + @invitation.recipient.name + '.'
    id = @invitation.recipient_id.to_s
    channel = "private-conversation." + id #private channel for recipient via Pusher
    Pusher.trigger(channel, 'game_request', {:from => current_user.id, :sender => current_user.name, :invitation => @invitation.id })
  end

  private

  def invitation_params
    params.require(:invitation).permit(:sender_id, :recipient_id)
  end
end
