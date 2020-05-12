#!/usr/bin/env ruby
require_relative "../lib/board.rb"
require_relative "../lib/player.rb"
require_relative "../lib/game_logic.rb"
require 'colorize'

def render(display)
  puts # add a newline
  puts "|-----|-----|-----|"
  puts "|  #{display[0]}  |  #{display[1]}  |  #{display[2]}  |"
  puts "|-----|-----|-----|"
  puts "|  #{display[3]}  |  #{display[4]}  |  #{display[5]}  |"
  puts "|-----|-----|-----|"
  puts "|  #{display[6]}  |  #{display[7]}  |  #{display[8]}  |"
  puts "|-----|-----|-----|"
  puts
end

def get_player_profile(game)
  get_player_name(game)
  get_player_symbol(game)
  game.switch_players
  get_player_name(game)
  get_player_symbol(game)
end

def get_player_name(game)
  loop do
    print "#{game.current_player.name} enter your name as a text without a space or symbol: "
    name = gets.chomp
    if !(name =~ /^[0-9a-zA-Z]{1,10}$/).nil?  #/^[0-9a-zA-Z]+$/    
      game.current_player.name = name.capitalize # capitalize the first letter of the name
      return
    else
      puts "Invalid name format, try again!"
    end
  end
end

def get_player_symbol(game)
  loop do
    print "#{game.current_player.name} enter your symbol as just one letter: "
    piece = gets.chomp
    if (piece =~ /^[a-zA-Z]$/).nil? || (game.player_a.piece == piece.upcase || game.player_b.piece == piece.upcase)
      puts "Invalid symbol format, or symbol already exists. Try again!"      
    else
      game.current_player.piece = piece.upcase
      return
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

def obtain_coordinates(current_player)
  puts "#{current_player.name} (#{current_player.piece}), Make a selection between 1 and 9"
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

# $gamePlay the game here

$game = TicTacToeGame.new
render($game.board.display)

get_player_profile($game)
loop do
  $game.board.update_board(obtain_coordinates($game.current_player), $game.current_player.piece)
  render($game.board.display)
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
