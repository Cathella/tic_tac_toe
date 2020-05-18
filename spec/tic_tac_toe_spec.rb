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
  end

  describe '#win?' do
    it "it should return 'true' if the first row are all 'X' or 'O'" do
      board.display = [X, X, X, 4, 5, 6, 7, 8, 9]
      expect(board.win?(X)).to eq(true)
    end  

    it "it should return 'true' if the second row are all 'X'" do
      board.display = [1, O, 3, X, X, X, O, 8, 9]
      expect(board.win?(X)).to eq(true)
    end

    it "it should return 'true' if the third row are all 'X'" do
      board.display = [1, 2, 3, 4, 5, 6, X, X, X]
      expect(board.win?(X)).to eq(true)
    end
    
    it "it should return 'true' if the first column are all 'X' or 'O'" do
      board.display = [O, 2, 3, O, 5, 6, O, 8, 9]
      expect(board.win?(O)).to eq(true)
    end

    it "it should return 'true' if the second column are all 'X' or 'O'" do
      board.display = [1, O, 3, 4, O, 6, 7, O, 9]
      expect(board.win?(O)).to eq(true)
    end

    it "it should return 'true' if the third column are all 'X' or 'O'" do
      board.display = [1, 2, O, 4, 5, O, 7, 8, O]
      expect(board.win?(O)).to eq(true)
    end

    it "it should return 'true' if any of the diagonals are all 'X' or 'O'" do
      board.display = [O, 2, 3, 4, O, 6, 7, 8, O]
      expect(board.win?(O)).to eq(true)
    end

    it "it should return 'true' if any of the diagonals are all 'X' or 'O'" do
      board.display = [1, 2, X, 4, X, 6, X, 8, 9]
      expect(board.win?(X)).to eq(true)
    end
  end

  describe '#filled?' do
    it "it should return 'true' if all cells are 'X' and 'O'" do
      board.display = [X, O, X, X, O, O, O, X, X]
      expect(board.filled?).to eq(true)
    end

    it "it should return 'false' if all cells are not only 'X' and 'O'" do
      board.display = [X, O, X, 4, O, O, O, X, X]
      expect(board.filled?).to eq(false)
    end
  end
 end
