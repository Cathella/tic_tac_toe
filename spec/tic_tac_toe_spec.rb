require_relative '../lib/player.rb'
require_relative '../lib/board.rb'
require_relative '../lib/game_logic.rb'

describe Board do
  let(:board) { Board.new }
  X = 'X'.freeze
  O = 'O'.freeze

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

describe TicTacToeGame do
  let(:board) { Board.new }
  let(:game) { TicTacToeGame.new }
  let(:p1) { Player.new(board: board, name: "Player A", piece: 'X') }
  let(:p2) { Player.new(board: board, name: "Player B", piece: 'O') }
  let(:current_player) { p1 }

  describe '#validate_coordinate' do
    it "returns 'true' when arg is in the range 1 to 9" do
      expect(game.validate_coordinate(4)).to eq(true)
    end

    it "returns 1 when arg is not in the range 1 to 9" do
      expect(game.validate_coordinate(10)).to eq(1)
    end

    it "returns true when the chosen cell is free" do
      game.board.display[0] = X
      expect(game.board.empty?(3)).to eq(true)
    end

    it "returns 'false' when the chosen cell is not free" do
      game.board.display[0] = X
      expect(game.board.empty?(1)).to eq(false)
    end

    it "returns 'true' when the chosen cell is vald and free" do
      game.board.display[3] = X
      expect(game.board.empty?(1)).to eq(true)
    end
  end
end

describe '#obtain_coordinates' do
  let(:game) { TicTacToeGame.new }

  it 'should return 1 if given cell is not in the range 1...9' do
    expect(game.validate_coordinate(10)).to eq(1)
  end

  it 'should return 2 if given cell is not free' do
    game.board.display[2] = 'O'
    expect(game.validate_coordinate(3)).to eq(2)
  end
end
