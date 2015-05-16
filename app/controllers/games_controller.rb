class GamesController < ApplicationController
  respond_to :html, :js

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @move = Move.new(:game => @game)
    @moves = @game.moves.all
    #Check to see if there is an existing conversation. If not, create a new one
  end

  def create
    @game = Game.new room_params
    @game.save
    redirect_to @game
    id = @game.player2_id.to_s
    channel = 'private-conversation.' + id
    Pusher.trigger(channel, 'game_acceptance', {:game => @game.id })
  end

  private

  def room_params
    params.require(:game).permit(:player1_id, :player2_id, :invitation_id)
  end
end
