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

  def validate_coordinate(cell)
    if !(1..9).include?(cell)
      return NOT_VALID
    elsif !@board.is_empty?(cell)
      return NOT_EMPTY
    end
    true
  end

  def move(x_y_coord)
    @board.display[x_y_coord - 1] = @current_player.piece
  end

  def game_over?
    return "win" if @board.winning? @current_player.piece
    return "draw" if @board.filled?

    false
  end

  def switch_players
    @current_player = @current_player == @player_a ? @player_b : @player_a
  end
end
