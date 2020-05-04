class TicTacToe
  def initialize
    @board = Board.new
    @player = Player.new
  end  
end

class Player

  def initialize(piece, board, name = "Anonymous")
    @name = name
    @piece = piece
    @board = board
  end

  def get_coordinates
    puts "#{@name} (#{@piece}), Enter coordinates in form of x,y"
    while true
      coordinates = gets.chomp.split(',').map { |ch| ch.to_i }
      if (coordinates.size != 2)
        print_user_message("Wrong coordinate format!")
      else
        break if @board.add_new_piece(coordinates, @piece)
      end
    end
  end
end

class  Board
  def initialize
    @board = Array.new(3){Array.new(3)}       #[ [nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end 

  def render_board
    print_user_message("\n")
    @board.each do |row|
      row.each {|cell| cell.nil? ? print('-') : print_user_message(cell.to_s)}
      print_user_message("\n")
    end
    print_user_message("\n")  #add a newline
  end
  
  def add_new_piece(x_y_coord, piece)
    if coordinate_valid?
      @board[x_y_coord[0]][x_y_coord[1]] = piece
      return true
    end
    false
  end

  def coordinate_valid?(x_y_coord)
    within_valid_coord?(x_y_coord) && empty_coord?(x_y_coord)
  end

  def within_valid_coord(x_y_coord)
    if (0..2).include?(x_y_coord[0]) && (0..2).include?(x_y_coord[1])
      true
    else
      print_user_message("Coordinates out of range!. Try again!")
      false
    end
  end

  def empty_coord?(coord)
    if @board[coord[0]][coord[1]].nil?
      true
    else
      print_user_message("Location previously played. Make a new choice.")
      false
    end
  end

  def rows_array
    @board
  end

  def cols_array
    verticals = []
    for i in 0...@board.length do
      verticals << [@board[0][i], @board[1][i], @board[2][i]]
    end
  end

  def diagonals_array
    [[@board[0][0], @board[1][1], @board[2][2]], [@board[0][2], @board[1][1], @board[2][0]]]
  end

  def board_filled?
    @board.all? do |row|
      row.none?(&:nil?)
    end
  end

  def check_win(winning_arr, piece)
    winning_arr.any? do |row|
      row.all? { |cell| cell == piece }
    end
  end

  def winning?(piece)
    check_win(rows_array, piece) || check_win(cols_array, piece) || check_win(diagonals_array, piece)
  end
end
