class MovesController < ApplicationController
  respond_to :html, :js

  def show
    @room = Game.find(params[:game_id])
    @move = @room.moves.find(params[:id])
  end

  def create
    @game = Game.find(params[:game_id])
    @move = @game.moves.build move_params
    if @game.player1_id == current_user.id
      @id = @game.player2_id
    elsif @game.player2_id == current_user.id
      @id = @game.player1_id
    end
    @move.save
    redirect_to game_move_path(@game, @move)
    # find the opponent's id for private channel
    channel = 'private-conversation.' + @id.to_s
    Pusher.trigger(channel, 'new_move', {user: @move.user_id, game: @move.game_id, fen: @move.piece, object_notation: @move.notation})
  end

  private

  def move_params
    params.require(:move).permit(:notation, :game_id, :piece, :user_id)
  end
end
