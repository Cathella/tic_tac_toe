class TicTacToeGame

  attr_accessor :board, :player_a, :player_b, :current_player

  def initialize
    @board = Board.new
    @player_a = Player.new(board: @board, name: "Player A", piece: :X)
    @player_b = Player.new(board: @board, name: "Player B", piece: :O)
    @current_player = @player_a
  end

  def game_over?
    if @board.winning?(@current_player.piece)
      return "win"
    elsif @board.filled?
      return "draw"
    end
    false
  end
  
  def switch_players
    @current_player = @current_player == @player_a ? @player_b : @player_a
  end
end
