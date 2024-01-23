class Board
	WINNING_SEQUENCES = [ 
		[1, 2, 3], [4, 5, 6], [7, 8, 9],
		[1, 4, 7], [2, 5, 8], [3, 6, 9],
		[1, 5, 9], [3, 5, 7]
	]

	attr_accessor :squares

  def initialize
		self.squares = {}
		(1..9).each { |int| self.squares[int] = Square.new }
  end

	def get_square_at(key)
		squares[key]
	end

	def set_square_at(key, marker)
  	squares[key].marker = marker
	end

	def unmarked_keys
  	squares.select { |_,sqr| sqr.unmarked? }.keys
	end

	def full?
     unmarked_keys.empty?
	end

	def someone_won?
  	!!detect_winner
	end

	def detect_winner
  	WINNING_SEQUENCES.each do |seq|
    	if squares[seq[0]].marker == TTTGame::HUMAN_MARKER &&
				 squares[seq[1]].marker == TTTGame::HUMAN_MARKER &&
				 squares[seq[2]].marker == TTTGame::HUMAN_MARKER
				return TTTGame::HUMAN_MARKER
			elsif squares[seq[0]].marker == TTTGame::COMPUTER_MARKER &&
				    squares[seq[1]].marker == TTTGame::COMPUTER_MARKER &&
			      squares[seq[2]].marker == TTTGame::COMPUTER_MARKER
				return TTTGame::COMPUTER_MARKER
			end
		end
	nil
	end
end

class Square
	INITIAL_MARKER = ' '

	attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
		@marker = marker
  end

	def to_s
    @marker
	end

	def unmarked?
  	marker == INITIAL_MARKER
	end
end

class Player
	attr_reader :marker

  def initialize(marker)
		@marker = marker
  end
end

class TTTGame
	HUMAN_MARKER = 'X'
	COMPUTER_MARKER = 'O'

	attr_reader :board, :human, :computer

	def initialize
  	@board = Board.new
		@human = Player.new(HUMAN_MARKER)
		@computer = Player.new(COMPUTER_MARKER)
	end
	
	def display_welcome_message
		puts "Welcome to tic tac toe! Have fun playing the game!"
	end

	def display_goodbye_message
		puts "Thanks for playing tic tac toe! Goodbye."
	end

	def display_result
  	if board.detect_winner == TTTGame::HUMAN_MARKER
      puts "You won!"
		elsif board.detect_winner == TTTGame::COMPUTER_MARKER
			puts "You lose!"
		else
			puts "It's a tie..."
		end
	end

	def display_board
		system 'clear'
		puts "You're a #{human.marker}, computer is a #{computer.marker}."
  	puts
  	puts "     |     |"
  	puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
  	puts "     |     |"
  	puts "-----+-----+-----"
  	puts "     |     |"
  	puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
  	puts "     |     |"
  	puts "-----+-----+-----"
  	puts "     |     |"
  	puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
  	puts "     |     |"
  	puts
	end

	def human_moves
  	puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
		square = nil
		loop do
    	square = gets.chomp.to_i
			break if board.unmarked_keys.include?(square)
			puts "Sorry, not a valid choice..."
		end
		board.set_square_at(square, human.marker)
	end

	def computer_moves
  	board.set_square_at(board.unmarked_keys.sample, computer.marker)
	end

  def play
    display_welcome_message
		display_board
    loop do
			human_moves
      break if board.someone_won? || board.full?

			computer_moves
			display_board
      break if board.someone_won? || board.full?
    end
		display_board
    display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play
