class Board
  attr_accessor :display
  def initialize
    @display = (1..9).to_a
  end

  def rows_array
    [[@display[0], @display[1], @display[2]],
     [@display[3], @display[4], @display[5]],
     [@display[6], @display[7], @display[8]]]
  end

  def cols_array
    [[@display[0], @display[3], @display[6]],
     [@display[1], @display[4], @display[7]],
     [@display[2], @display[5], @display[8]]]
  end

  def diagonals_array
    [[@display[0], @display[4], @display[8]],
     [@display[2], @display[4], @display[6]]]
  end

  def filled?
    @display.all? { |cell| cell.is_a?(String) }
  end

  def check_win(winning_arr, piece)
    winning_arr.any? do |row|
      row.all? { |cell| cell == piece }
    end
  end

  def winning?(piece)
    check_win(rows_array, piece) || check_win(cols_array, piece) || check_win(diagonals_array, piece)
  end

  def empty?(cell)
    !@display[cell - 1].is_a?(String)
  end
end
