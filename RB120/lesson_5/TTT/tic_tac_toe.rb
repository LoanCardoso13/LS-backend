module Validatable
  def validate_user_input(*validators)
    answer = ''
    loop do
      answer = gets.chomp
      break if validators.include?(answer)
      puts "Sorry, invalid input."
    end
    answer
  end

  def check_if_empty_user_input
    answer = ''
    loop do
      answer = gets.chomp.strip
      break unless answer.empty?
      puts "Sorry, it can't be blank."
    end
    answer
  end

  def press_enter(bar_size)
    puts "[press enter]".rjust(bar_size)
    gets.chomp
  end
end

module Displayable
  BAR_SIZE = 80

  def centered(line)
    puts line.center(BAR_SIZE)
  end

  def bannerized(line)
    len = line.length
    centered "+-#{'-' * len}-+"
    centered "| #{' ' * len} |"
    centered "| #{line} |"
    centered "| #{' ' * len} |"
    centered "+-#{'-' * len}-+"
  end

  def empty_line
    puts
  end

  def clear_screen
    system 'clear'
  end
end

class Board
  WINNING_SEQUENCES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
  ]

  include Displayable

  attr_reader :squares

  def initialize
    @squares = {}
    (1..9).each { |key| squares[key] = Square.new }
  end

  def []=(key, marker)
    squares[key].marker = marker
  end

  def [](key)
    squares[key].marker
  end

  def empty_squares
    squares.keys.select { |key| squares[key].unmarked? }
  end

  def full?
    empty_squares.empty?
  end

  def someone_won?
    !!winner_marker
  end

  def display
    empty_line
    centered "     |     |     "
    centered "  #{squares[1]}  |  #{squares[2]}  |  #{squares[3]}  "
    centered "     |     |     "
    centered "-----+-----+-----"
    centered "     |     |     "
    centered "  #{squares[4]}  |  #{squares[5]}  |  #{squares[6]}  "
    centered "     |     |     "
    centered "-----+-----+-----"
    centered "     |     |     "
    centered "  #{squares[7]}  |  #{squares[8]}  |  #{squares[9]}  "
    centered "     |     |     "
    empty_line
  end

  def winner_marker
    WINNING_SEQUENCES.each do |sequence|
      sequenced_squares = squares.values_at(*sequence)
      if three_identical_markers?(sequenced_squares)
        return sequenced_squares.first.marker
      end
    end
    nil
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).map(&:marker)
    return false if markers.size != 3
    markers.uniq.size == 1
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize
    @marker = INITIAL_MARKER
  end

  def to_s
    marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    !unmarked?
  end
end

class Player
  attr_accessor :name, :marker, :score

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end
end

class Human < Player
  def marks(board)
    puts "Please choose a square: #{joinor(board.empty_squares)}"
    user_choice = validate_user_choice(board)
    board[user_choice] = marker
  end

  def joinor(array)
    if array.size > 1
      array[0..-2].join(', ') + ' or ' + array.last.to_s
    else
      array[0]
    end
  end

  def validate_user_choice(board)
    square = nil
    loop do
      square = gets.chomp
      break if board.empty_squares.include?(square.to_i)
      puts "Sorry, invalid input. Please choose a number from above."
    end
    square.to_i
  end
end

class Computer < Player
  CHARACTERS = %w(R2D2 Chappie Mr.Roboto AI-jedi)

  def marks(board)
    choice = strategies(board)
    board[choice] = marker
  end

  def strategies(board)
    # iterate through winning sequences
    # if a sequence has 2 marks from self and an empty square
    # return the position of that empty square
    #
    # iterate through winning sequences
    # if a sequence has 1 empty square and only 2 types of markers
    # return the position of that empty square

    if board.empty_squares.include?(5)
      return 5
    end

    Board::WINNING_SEQUENCES.each do |seq|
      if seq.count { |pos| board[pos] == marker } == 2 &&
         seq.map { |pos| board[pos] }.include?(Square::INITIAL_MARKER)
        return seq.select { |pos| board[pos] == Square::INITIAL_MARKER }[0]
      end
    end

    Board::WINNING_SEQUENCES.each do |seq|
      if seq.map { |pos| board[pos] }.uniq.size == 2 &&
         seq.count { |pos| board[pos] == Square::INITIAL_MARKER } == 1
        return seq.select { |pos| board[pos] == Square::INITIAL_MARKER }[0]
      end
    end

    board.empty_squares.sample
  end
end

class GameEngine
  include Validatable, Displayable

  attr_reader :board
  attr_accessor :player1, :player2

  def initialize
    reset
  end

  def reset
    @board = Board.new
  end

  def game_setup
    clear_screen
    display_welcome_message
    user_name, computer_name = name_participants
    empty_line
    user_marker, computer_marker = define_markers
    define_order_of_players(user_name, computer_name, user_marker, computer_marker)
    empty_line
    acknowledge_players
  end

  def players_board_interactions
    loop do
      [player1, player2].each do |player|
        player.marks(board)
        clear_and_display_game
        break if board.someone_won? || board.full?
      end
      break if board.someone_won? || board.full?
    end
  end

  def display_score
    empty_line
    bannerized "Current score: #{player1.name} #{player1.score} x #{player2.score} #{player2.name}"
    empty_line
  end

  def main_game
    loop do
      clear_and_display_game
      players_board_interactions
      display_result
      break unless play_again?
      reset
    end
  end

  def play
    game_setup
    main_game
    empty_line
    announce_main_game_winner
    display_goodbye_message
    empty_line
  end

  def display_welcome_message
    centered "Welcome to Tic Tac Toe!"
    empty_line
  end

  def display_goodbye_message
    centered "Thanks for playing Tic Tac Toe!"
  end

  def announce_main_game_winner
    if player1.score > player2.score
      centered "#{player1.name} has won the game!"
    elsif player1.score < player2.score
      centered "#{player2.name} has won the game!"
    end
  end

  def clear_and_display_game
    clear_screen
    empty_line
    display_participants
    board.display
    display_score
  end

  def display_participants
    centered "#{player1.name} is #{player1.marker}, #{player2.name} is #{player2.marker}."
  end

  def name_participants
    centered "To start things off, may I have your name please?"
    user_name = check_if_empty_user_input
    computer_name = Computer::CHARACTERS.sample
    [ user_name, computer_name ]
  end

  def acknowledge_players
    puts "Okay, this will be a match of #{player1.name} against #{player2.name}."
    puts "#{player1.name} will start."
    press_enter(BAR_SIZE)
  end

  def define_markers
    alphabet = ('A'..'Z').to_a
    centered "What marker would you like to use?"
    centered "Please choose among uppercase characters (A-Z)."
    user_marker = validate_user_input(*alphabet)
    empty_line
    centered "And what marker will you choose to your adversary? (A-Z)"
    computer_marker = validate_user_input(*alphabet)
    [ user_marker, computer_marker ]
  end

  def define_order_of_players(user_name, computer_name, user_marker, computer_marker)
    ask_who_goes_first
    choice = validate_user_input('c', 'p', 'r')
    case choice
    when 'c'
      self.player1 = Computer.new(computer_name, computer_marker)
      self.player2 = Human.new(user_name, user_marker)
    when 'p'
      self.player1 = Human.new(user_name, user_marker)
      self.player2 = Computer.new(computer_name, computer_marker)
    when 'r'
      randomize_players_order(user_name, computer_name, user_marker, computer_marker)
    end
  end

  def randomize_players_order(user_name, computer_name, user_marker, computer_marker)
    random_order_players = [ Human.new(user_name, user_marker), Computer.new(computer_name, computer_marker) ].shuffle!
    self.player1 = random_order_players[0]
    self.player2 = random_order_players[1]
  end

  def ask_who_goes_first
    empty_line
    centered "Who should play first?"
    centered "(c) for Computer"
    centered "(p) for Player"
    centered "(r) for Random"
    empty_line
  end

  def display_result
    if board.someone_won?
      print_winner_and_update_score(board.winner_marker)
    else
      puts "It's a tie..."
    end
  end

  def print_winner_and_update_score(marker)
    case marker
    when player1.marker
      puts "#{player1.name} is the winner!"
      player1.score += 1
    when player2.marker
      puts "#{player2.name} is the winner!"
      player2.score += 1
    end
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    answer = validate_user_input('y', 'n')
    answer == 'y'
  end
end

GameEngine.new.play
