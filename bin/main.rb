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
  game.switch_players
end

def get_player_name(game)
  loop do
    print "#{game.current_player.name} enter your name as a text without a space or symbol: "
    name = gets.chomp
    if !(name =~ /^[0-9a-zA-Z]{1,10}$/).nil? # /^[0-9a-zA-Z]+$/
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

def obtain_coordinates(game)
  puts "#{game.current_player.name} (#{game.current_player.piece}), Make a selection between 1 and 9"
  loop do
    coordinates = gets.chomp.split('')
    if coordinates.size != 1
      puts("Wrong input format!")
    else
      coordinates[0] = coordinates[0].to_i if coordinates[0] =~ /^[1-9]$/
      status = game.validate_coordinate(coordinates[0])
      if status == TicTacToeGame::NOT_VALID 
        puts("Coordinates out of range!. Try again!\n")
      elsif status == TicTacToeGame::NOT_EMPTY
        puts("Location previously played. Make a new choice.\n")
      else
        return coordinates[0]
      end
    end
  end
end

# $gamePlay the game here

public

game = TicTacToeGame.new
render(game.board.display)

get_player_profile(game)
loop do
  game.board.update_board(obtain_coordinates(game), game.current_player.piece)
  render(game.board.display)
  case game.game_over?
  when "win"
    puts "Congratulations #{game.current_player.name}, you have won!"
    break
  when "draw"
    puts "Oops! You've drawn!\n"
    break
  else
    game.switch_players
  end
end
