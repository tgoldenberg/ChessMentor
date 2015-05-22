class BoardsController < ApplicationController
  respond_to :html, :js

  def new
    @board = Board.new
    @board.move_id = params[:move_id]
    @board.fen = params[:fen]
    if current_user.id == @board.move.game.player1_id
      @id = @board.move.game.player2_id
    else
      @id = @board.move.game.player1_id
    end
    @board.save
    channel = 'private-conversation.' + @id.to_s
    Pusher.trigger(channel, 'rearrange_board', { :fen => @board.fen })
  end

  private

    def board_params
      params.require(:board).permit(:fen, :move_id)
    end
end
