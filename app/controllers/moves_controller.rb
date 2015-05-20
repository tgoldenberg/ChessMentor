class MovesController < ApplicationController
  respond_to :html, :js

  def index
    @game = Game.find(params[:room_id])
    @moves = @game.moves.all
  end

  def show
    @room = Game.find(params[:game_id])
    @move = @room.moves.find(params[:id])
  end

  def create
    @game = Game.find(params[:game_id])
    @move = @game.moves.build move_params
    @move.user_id = current_user.id
    @move.save
    redirect_to room_move_path(@game, @move)
    # find the opponent's id for private channel
    if @game.player1_id == current_user.id
      id = @game.player2_id.to_s
    elsif @game.player2_id == current_user.id
      id = @game.player1_id.to_s
    end
    channel = 'private-conversation.' + id
    Pusher.trigger(channel, 'new_move', {user: @move.user_id, game: @move.game_id, fen: @move.piece, object_notation: @move.notation})
  end

  private

  def move_params
    params.require(:move).permit(:notation, :game_id, :piece, :user_id)
  end
end
