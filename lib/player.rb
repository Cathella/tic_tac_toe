class Player
  attr_accessor :name, :piece

  def initialize(piece:, board:, name: "Anonymous")
    @name = name
    @piece = piece
    @board = board
  end
end
