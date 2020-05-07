class Board
  def initialize
    #@play_board = Array.new(3) { Array.new(3) } # [ [nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
    @play_board = [ ['1', '2', '3'], ['4', '5', '6'], ['7', '8', '9']]
  end

  def render
    # print_user_message("\n")
    # @play_board.each do |row|
    #   row.each { |cell| cell.nil? ? print('-') : print_user_message(cell.to_s) }
    #   print_user_message("\n")
    # end
    # print_user_message("\n") # add a newline
    puts "    A     B     C   "
    puts " |-----|-----|-----|"
    puts "1|  #{@play_board[0]}  |  #{@play_board[1]}  |  #{@play_board[2]}  |"
    puts " |-----|-----|-----|"
    puts "2|  #{@play_board[3]}  |  #{@play_board[4]}  |  #{@play_board[5]}  |"
    puts " |-----|-----|-----|"
    puts "3|  #{@play_board[6]}  |  #{@play_board[7]}  |  #{@play_board[8]}  |"
    puts " |-----|-----|-----|"
  end

  def add_new_piece(x_y_coord, piece)
    if coordinate_valid?(x_y_coord)
      @play_board[x_y_coord] = piece
      return true
    end
    false
  end

  def coordinate_valid?(x_y_coord)
    coord_within_range?(x_y_coord) && coord_empty?(x_y_coord)
  end

  def coord_within_range?(x_y_coord)
    if (1..9).include?(x_y_coord)
      true
    else
      print_user_message("Coordinates out of range!. Try again!\n")
      false
    end
  end

  def coord_empty?(coord)
    unless @play_board[coord].is_a?(Symbol)
      true
    else
      print_user_message("Location previously played. Make a new choice.\n")
      false
    end
  end

  def rows_array
    [[@play_board[0], @play_board[1], @play_board[2]],
     [@play_board[3], @play_board[4], @play_board[5]],
     [@play_board[6], @play_board[7], @play_board[8]]]
  end

  def cols_array
    [[@play_board[0], @play_board[3], @play_board[6]],
     [@play_board[1], @play_board[4], @play_board[7]],
     [@play_board[2], @play_board[5], @play_board[8]]]
  end

  def diagonals_array
    [[@play_board[0], @play_board[4], @play_board[8]],
     [@play_board[2], @play_board[4], @play_board[6]]]
  end

  def filled?
    @board.all? { |cell| cell.is_a?(Symbol) }
  end

  def check_win(winning_arr, piece)
    winning_arr.all? { |cell| cell == piece }
  end

  def winning?(piece)
    check_win(rows_array, piece) || check_win(cols_array, piece) || check_win(diagonals_array, piece)
  end
end
