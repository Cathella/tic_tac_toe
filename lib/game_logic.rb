class TicTacToeGame
  attr_accessor :board, :player_a, :player_b, :current_player
  NOT_VALID = 1
  NOT_EMPTY = 2

  def initialize
    @board = Board.new
    @player_a = Player.new(board: @board, name: "Player A", piece: :X)
    @player_b = Player.new(board: @board, name: "Player B", piece: :O)
    @current_player = @player_a
  end

  def game_over?
    return "win" if @board.winning? @current_player.piece
    return "draw" if @board.filled?

    false
  end

  def validate_coordinate(coord)
    if !(1..9).include?(coord)
      return NOT_VALID
    elsif @board.display[coord].is_a?(Symbol)
      return NOT_EMPTY
    end
    true
  end

  def switch_players
    @current_player = @current_player == @player_a ? @player_b : @player_a
  end
end
