

class  Board
  def initialize
    p @board = Array.new(3){Array.new(3)}       #[ [nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
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
    within_valid_coord?(x_y_coord) &&  empty_coord?(x_y_coord)
  end

  def within_valid_coord(x_y_coord)
    if (0..2).include?(x_y_coord[0]) && (0..2).include?(x_y_coord[1])
      return true
    end
    print_user_message("Coordinates out of range!. Try again!")
    false
  end

  def empty_coord? (coord)
    if @board[coord[0]][coord[1]].nil?
      return true
      print_user_message("Location previously played. Make a new choice.")
      false
    end
  end

  def rows_array
    @board
  end
  def cols_array
    
  end
  def diagonals_array
    [[@board[0][0], @board[1][1], @board[2][2]], [@board[0][2], @board[1][1], @board[2][0]]]
  end
  def winning?

  end
end
