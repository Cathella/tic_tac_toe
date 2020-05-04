#!/usr/bin/env ruby

def print_user_message(msg)
  print msg
end

class Board
  def initialize
    @board = Array.new(3) { Array.new(3) } # [ [nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  def render_board
    print_user_message("\n")
    @board.each do |row|
      row.each { |cell| cell.nil? ? print('-') : print_user_message(cell.to_s) }
      print_user_message("\n")
    end
    print_user_message("\n") # add a newline
  end

  def add_new_piece(x_y_coord, piece)
    if coordinate_valid?(x_y_coord)
      @board[x_y_coord[0]][x_y_coord[1]] = piece
      return true
    end
    false
  end

  def coordinate_valid?(x_y_coord)
    within_valid_coord?(x_y_coord) && empty_coord?(x_y_coord)
  end

  def within_valid_coord?(x_y_coord)
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
end

class Player
  def initialize(piece, board, name = "Anonymous")
    @name = name
    @piece = piece
    @board = board
  end

  def request_coordinates
    puts "#{@name} (#{@piece}), Enter coordinates in form of x,y"
    loop do
      coordinates = gets.chomp.split(',').map(&:to_i)
      if coordinates.size != 2
        print_user_message("Wrong coordinate format!")
      elsif @board.add_new_piece(coordinates, @piece)
        break
      end
    end
    true
  end
end

board = Board.new

player = Player.new(:x, board)

print_user_message("Now, your move is now displayed on the board") if player.request_coordinates
