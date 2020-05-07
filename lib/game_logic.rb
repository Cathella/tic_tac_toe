class TicTacToeGame
  def initialize
    @board = Board.new
    @player_a = Player.new(board: @board, name: "Player A", piece: :X)
    @player_b = Player.new(board: @board, name: "Player B", piece: :O)
    @current_player = @player_a
  end

  def get_player_profile
    @player_a.get_player_name(@player_a.name)
    @player_a.get_player_symbol(@player_a.name)
    @player_b.get_player_name(@player_b.name)
    @player_b.get_player_symbol(@player_b.name)
  end

  def play_game
    @board.render
    get_player_profile
    loop do
      @current_player.obtain_coordinates
      @board.render
      break if game_over?

      switch_players
    end
  end

  def game_over?
    if @board.winning?(@current_player.piece)
      puts "Congratulations #{@current_player.name}, you have won!"
    elsif @board.filled?
      puts "Oop! You have drawn!"
    else return false
    end
    true
  end

  def switch_players
    @current_player = @current_player == @player_a ? @player_b : @player_a
  end
end
