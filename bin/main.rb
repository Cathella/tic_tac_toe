#!/usr/bin/env ruby
require_relative "../lib/player.rb"
require_relative "../lib/game_logic.rb"
def print_user_message(msg)
  print msg
end

class Board
  def initialize
    @play_board = Array.new(3) { Array.new(3) } # [ [nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
  end

  # @@display_arr = [["----", "----", "-"], ["----", "----", "-"], ["----", "----", "-"]]

  def render_board
    print_user_message("\n")
    @play_board.each do |row|
      row.each { |cell| cell.nil? ? print('-') : print_user_message(cell.to_s) }
      print_user_message("\n")
    end
    print_user_message("\n") # add a newline
  end

  def add_new_piece(x_y_coord, piece)
    if coord_within_range?(x_y_coord)
      @play_board[x_y_coord[0]][x_y_coord[1]] = piece
      return true
    end
    false
  end

  def coordinate_valid?(x_y_coord)
    coord_within_range?(x_y_coord) && coord_empty?(x_y_coord)
  end

  def coord_within_range?(x_y_coord)
    if (0..2).include?(x_y_coord[0]) && (0..2).include?(x_y_coord[1])
      true
    else
      print_user_message("Coordinates out of range!. Try again!\n")
      false
    end
  end

  def coord_empty?(coord)
    if @play_board[coord[0]][coord[1]].nil?
      true
    else
      print_user_message("Location previously played. Make a new choice.")
      false
    end
  end

  def rows_array
    @play_board
  end

  def cols_array
    verticals = []
    (0...@play_board.length).each do |i|
      verticals << [@play_board[0][i], @play_board[1][i], @play_board[2][i]]
    end
    verticals
  end

  def diagonals_array
    [[@play_board[0][0], @play_board[1][1], @play_board[2][2]],
     [@play_board[0][2], @play_board[1][1], @play_board[2][0]]]
  end

  def filled?
    @play_board.all? do |row|
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

game = TicTacToeGame.new

game.play_game
