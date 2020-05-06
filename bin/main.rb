#!/usr/bin/env ruby

def print_user_message(msg)
  print msg
end

class TicTacToe
  def initialize
    @board = Board.new
    @player_A = Player.new(:X, @board, "Player A")
    @player_B = Player.new(:O, @board, "Player B")
    @current_player = @player_A
  end

  def play_game
    @board.render_board
    loop do
      @current_player.obtain_coordinates
      @board.render_board
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
    @current_player = @current_player == @player_A? @player_B : @player_A
  end
end

class Player
  attr_reader :name, :piece

  def initialize(piece, board, name = "Anonymous")
    @name = name
    @piece = piece
    @board = board
  end

  def obtain_coordinates
    puts "#{@name} (#{@piece}), Enter coordinates in form of x,y"
    loop do
      coordinates = gets.chomp.split(',').map(&:to_i)
      if coordinates.size != 2
        print_user_message("Wrong coordinate format!")
      else
        break if @board.add_new_piece(coordinates, @piece)
      end
    end
  end
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
    if coord_within_range?(x_y_coord)
      @board[x_y_coord[0]][x_y_coord[1]] = piece
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
      print_user_message("Coordinates out of range!. Try again!")
      false
    end
  end

  def coord_empty?(coord)
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
    (0...@board.length).each do |i|
      verticals << [@board[0][i], @board[1][i], @board[2][i]]
    end
    verticals
  end

  def diagonals_array
    [[@board[0][0], @board[1][1], @board[2][2]], [@board[0][2], @board[1][1], @board[2][0]]]
  end

  def filled?
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

game = TicTacToe.new

game.play_game

