class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  attr_reader :score, :squares

  def initialize
    @squares = {}
    @score = [0, 0]
    reset
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winner_marker
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  # returns winning marker or nil
  def winner_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def calculate_score(human_marker, computer_marker)
    if winner_marker == human_marker
      score[0] += 1
    elsif winner_marker == computer_marker
      score[1] += 1
    end
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.length != 3
    markers.uniq.size == 1
  end
end

class Square
  INITIAL_MARKER = " "

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

  def marked?
    !unmarked?
  end

  # def human_marked?
    # marker == TTTGame::HUMAN_MARKER
  # end

  # def computer_marked?
    # marker == TTTGame::COMPUTER_MARKER
  # end
end

class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

class Human < Player
end

class Computer < Player
  # Return AI choice of position to mark
  def strategy(board, human_marker, computer_marker)
    def winning_square(board, line, computer_marker)
      if line.count { |pos| board.squares[pos].marker == computer_marker } == 2 &&
         line.count { |pos| board.squares[pos].marker == Square::INITIAL_MARKER } == 1
        return line.select { |pos| board.squares[pos].marker == Square::INITIAL_MARKER }[0]
      end
      nil
    end

    Board::WINNING_LINES.each do |line|
      if !!winning_square(board, line, computer_marker)
        return winning_square(board, line, computer_marker)
      end
    end

    def losing_square(board, line, human_marker)
      if line.count { |pos| board.squares[pos].marker == human_marker } == 2 &&
         line.count { |pos| board.squares[pos].marker == Square::INITIAL_MARKER } == 1
        return line.select { |pos| board.squares[pos].marker == Square::INITIAL_MARKER }[0]
      end
      nil
    end

    Board::WINNING_LINES.each do |line|
      if !!losing_square(board, line, human_marker)
        return losing_square(board, line, human_marker)
      end
    end

    return 5 if board.unmarked_keys.include?(5)

    # Random pick
    board.unmarked_keys.sample
  end
end

class TTTGame
  # HUMAN_MARKER = "X"
  # COMPUTER_MARKER = "O"

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @turn_count = 0
  end

  def play
    clear_screen
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  attr_accessor :turn_count

  def main_game
    loop do
      display_board
      who_goes_first
      player_move
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board
    end
  end

  def ask_who_goes_first
    puts
    puts "Who should play first?"
    puts "- (c) for Computer"
    puts "- (p) for Player"
    puts "- (r) for Random"
    puts
  end

  def who_goes_first
    ask_who_goes_first
    answer = ''
    choices = %w(c p r)
    loop do
      answer = gets.chomp.downcase
      break if answer.start_with?(*choices)
      puts "Sorry, invalid answer."
    end
    self.turn_count += 1 if answer.start_with?('c')
    self.turn_count += [0, 1].sample if answer.start_with?('r')
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
    define_player
    define_computer
    puts "Have fun #{human.name}!"
  end

  def define_player
    puts "To kick things off, may I have your name please?"
    name = input_name
    puts "Cool, and what will be your marker?"
    puts "Please choose among uppercase characters (A-Z)."
    marker = input_marker
    @human = Human.new(name, marker)
  end

  def define_computer
    name = %w(R2D2 Chappie Mr.Roboto AI-jedi).sample
    puts "Alright, #{human.name}, you'll be playing against #{name}"
    puts "Which marker will you choose for your adversary? (A-Z)"
    marker = input_marker
    @computer = Computer.new(name, marker)
  end

  def input_marker
    marker = ''
    loop do
      marker = gets.chomp
      break if ('A'..'Z').include?(marker)
      puts "Sorry, gotta choose uppercase letters from A to Z."
    end
    marker
  end

  def input_name
    name = ''
    loop do
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, name can't be blank."
    end
    name
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear_screen
    display_board
  end

  def show_score
    puts "Player: #{board.score[0]} vs Computer: #{board.score[1]}"
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}"
    puts ""
    board.draw
    puts ""
    show_score
  end

  def joinor(arr_of_int, divisor = ', ', signal_last = ' or ')
    if arr_of_int.size > 1
      arr_of_int[0..-2].map(&:to_s).join(divisor) + signal_last + arr_of_int.last.to_s
    else
      arr_of_int[0]
    end
  end

  def human_moves
    puts "Choose a square ( #{joinor(board.unmarked_keys)} )"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def threat?
    !!board.imminent_threat
  end

  def computer_moves
    computer_mark_position = computer.strategy(board, human.marker, computer.marker)
    board[computer_mark_position] = computer.marker
  end

  def current_player_moves
    self.turn_count += 1
    if turn_count.odd?
      human_moves
    else
      computer_moves
    end
  end

  def display_result
    board.calculate_score(human.marker, computer.marker)
    clear_screen_and_display_board

    case board.winner_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear_screen
    system 'clear'
  end

  def reset
    board.reset
    self.turn_count = 0
    clear_screen
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end
end

game = TTTGame.new
game.play
