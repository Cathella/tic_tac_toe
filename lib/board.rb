class Board
  attr_accessor :display
  def initialize
    @display = (1..9).to_a
  end

  def win_arr
    [[0, 1, 2], [3, 4, 5], [6, 7, 8],
     [0, 3, 6], [1, 4, 7], [2, 5, 8],
     [0, 4, 8], [2, 4, 6]]
  end

  def filled?
    @display.all? { |cell| cell.is_a?(String) }
  end

  def empty?(cell)
    !@display[cell - 1].is_a?(String)
  end

  def win?(piece)
    win_arr.any? do |row|
      row.all? { |cell| @display[cell] == piece }
    end
  end
end
