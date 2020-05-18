require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative '../lib/game_logic.rb'

 describe Board do
  let (:board) { Board.new }
  X = 'X'
  O = 'O'

  describe '#empty?' do
    it "it should return 'true' if a cell is not 'X' or 'O'" do
      board.display = [1, X, 3, 4, 5, X, O, 8, 9]
      expect(board.empty?(3)).to eq(true)
    end

    it "it should return 'false' if a cell is 'X' or 'O'" do
      board.display = [1, X, 3, 4, 5, X, O, 8, 9]
      expect(board.empty?(7)).to eq(false)
    end    
  end
 end
