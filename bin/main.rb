#!/usr/bin/env ruby
require_relative "../lib/player.rb"
require_relative "../lib/game_logic.rb"
require_relative "../lib/board.rb"

def print_user_message(msg)
  print msg
end

game = TicTacToeGame.new

game.play_game
