#!/usr/bin/env ruby
require_relative "../lib/board.rb"
require_relative "../lib/player.rb"
require_relative "../lib/game_logic.rb"
require 'colorize'

$game = TicTacToeGame.new
# $game.board = Board.new

def render
  puts # add a newline
  puts "|-----|-----|-----|"
  puts "|  #{$game.board.display[0]}  |  #{$game.board.display[1]}  |  #{$game.board.display[2]}  |"
  puts "|-----|-----|-----|"
  puts "|  #{$game.board.display[3]}  |  #{$game.board.display[4]}  |  #{$game.board.display[5]}  |"
  puts "|-----|-----|-----|"
  puts "|  #{$game.board.display[6]}  |  #{$game.board.display[7]}  |  #{$game.board.display[8]}  |"
  puts "|-----|-----|-----|"
  puts
end

def get_player_profile
  $game.player_a.name = get_player_name($game.player_a.name)
  $game.player_a.piece = get_player_symbol($game.player_a.name)
  $game.player_b.name = get_player_name($game.player_b.name)
  $game.player_b.piece = get_player_symbol($game.player_b.name)
end

def get_player_name(player_name)
  loop do
    print "#{player_name} enter your name as a text without a space or symbol: "
    name = gets.chomp
    if !(name =~ /^[0-9a-zA-Z]{1,10}$/).nil?  #/^[0-9a-zA-Z]+$/    
      return name.capitalize # capitalize the first letter of the name
    else
      puts "Invalid name format, try again!"
    end
  end
end

def get_player_symbol(player_name)
  loop do
    print "#{player_name} enter your symbol as just one letter: "
    piece = gets.chomp
    if (piece =~ /^[a-zA-Z]$/).nil? || ($game.player_a.piece == piece.upcase || $game.player_b.piece == piece.upcase)
      puts "Invalid symbol format, or symbol already exists. Try again!"      
    else
      return @piece = piece.upcase
    end
  end
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
  if $game.board.display[coord].is_a?(Symbol)
    print_user_message("Location previously played. Make a new choice.\n")
    false
  else
    true
  end
end

def obtain_coordinates
  puts "#{$game.current_player.name} (#{$game.current_player.piece}), Make a selection between 1 and 9"
  loop do
    coordinates = gets.chomp.split('')
    if coordinates.size != 1
      print_user_message("Wrong input format!")
    else
      coordinates[0] = coordinates[0].to_i if coordinates[0] =~ /^[1-9]$/
      return coordinates[0] if coord_within_range?(coordinates[0]) && coord_empty?(coordinates[0])
    end
  end
end

render
get_player_profile
loop do
  $game.board.update_board(obtain_coordinates, $game.current_player.piece)
  render
  case $game.game_over?
  when "win"
    puts "Congratulations #{$game.current_player.name}, you have won!"
    break
  when "draw"
    puts "Oops! You've drawn!\n"
    break
  else
    $game.switch_players
  end
end






