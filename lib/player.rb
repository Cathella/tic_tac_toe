class Player
  attr_reader :name, :piece

  def initialize(piece:, board:, name: "Anonymous")
    @name = name
    @piece = piece
    @board = board
  end

  def get_player_name(player_n)
    loop do
      print "#{player_n} enter your name as a text without a space or symbol: "
      name = gets.chomp
      if !(name =~ /^[0-9a-zA-Z]+$/).nil?
        @name = name.capitalize # capitalize the first letter of the name
        break
      else
        puts "Invalid name format, try again!"
      end
    end
  end

  def get_player_symbol(player_n)
    loop do
      print "#{player_n} enter your symbol as just one letter: "
      piece = gets.chomp
      if !(piece =~ /^[a-zA-Z]$/).nil?
        @piece = piece.upcase
        break
      else
        puts "Invalid symbol format, try again!"
      end
    end
  end

  def obtain_coordinates
    puts "#{@name} (#{@piece}), Enter coordinates as:\nA1, A2, A3,\nB1, B2, B3,\nC1, C2, or C3"
    loop do
      # coordinates = gets.chomp.split(',').map(&:to_i)
      coordinates = gets.chomp.split('')
      if coordinates.size != 2
        print_user_message("Wrong coordinate format!")
      else
        if (coordinates[0] =~ /^[abcABC]$/) && (coordinates[1] =~ /^[123]$/)
          coordinates[0], coordinates[1] = coordinates[1].to_i - 1, coordinates[0].upcase.ord - 'A'.ord
        end
        break if @board.add_new_piece(coordinates, @piece)
      end
    end
  end
end
