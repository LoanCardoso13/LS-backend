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

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
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
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

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
  include Validatable

  def marks(board)
    puts "Please choose a square: #{joinor(board.empty_squares)}"
    user_choice = validate_user_input(*board.empty_squares.map(&:to_s))
    board[user_choice.to_i] = marker
  end

  def joinor(array)
    if array.size > 1
      "#{array[0..-2].join(', ')} or #{array.last}"
    else
      array[0]
    end
  end
end

class Computer < Player
  CHARACTERS = %w(R2D2 Chappie Mr.Roboto AI-jedi)

  def marks(board)
    choice = strategies(board)
    board[choice] = marker
  end

  def strategies(board)
    if board.empty_squares.include?(5)
      return 5
    end

    critical_moves = sequences_to_complete(board)
    offensive_move = sequences_to_complete(board)
                     .select { |_, mark| mark == marker }
    # It is imperative to ensure the whole board has been checked for
    # a chance to win before checking for a chance to avoid losing:
    return offensive_move.flatten[0] unless offensive_move.empty?
    return critical_moves[0][0] unless critical_moves.empty?
    # The #empty? guard clause ensures the method chains won't break
    # if a nil value is found

    board.empty_squares.sample
  end

  # This method returns an array containing sub-arrays of pairs of values
  # It is designed to find critical squares, i.e. squares representing
  # within a winning sequence, either:
  # A chance to win: 1 empty square and 2 marked by self/computer
  # A threat to lose: 1 empty square and 2 marked by opponent/player
  # Each pair of values corresponds to 1 critical square instance
  # The first value is the position of the critical/empty square
  # The second value is the marker of the other squares in the sequence
  def sequences_to_complete(board)
    answer = []
    Board::WINNING_SEQUENCES.each do |seq|
      empty_seq = seq.intersection(board.empty_squares)
      if empty_seq.size == 1 &&
         seq.map { |pos| board[pos] }.uniq.size == 2
        answer << [empty_seq[0], (seq - empty_seq).map { |pos| board[pos] }[0]]
      end
    end
    answer
  end
end

class GameEngine
  ALPHABET = ('A'..'Z').to_a

  include Validatable, Displayable

  attr_reader :board
  attr_accessor :player1, :player2, :user, :computer

  def initialize
    reset
    @user = Player.new(nil, nil)
    @computer = Player.new(nil, nil)
  end

  def play
    game_setup
    main_game
    empty_line
    announce_main_game_winner
    display_goodbye_message
    empty_line
  end

  private

  def game_setup
    clear_screen
    display_welcome_message
    name_participants
    empty_line
    define_markers
    define_order_of_players(user.name, computer.name,
                            user.marker, computer.marker)
    empty_line
    acknowledge_players
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

  def announce_main_game_winner
    if player1.score > player2.score
      centered "#{player1.name} has won the game!"
    elsif player1.score < player2.score
      centered "#{player2.name} has won the game!"
    end
  end

  def display_goodbye_message
    centered "Thanks for playing Tic Tac Toe!"
  end

  def display_welcome_message
    centered "Welcome to Tic Tac Toe!"
    empty_line
  end

  def name_participants
    centered "To start things off, may I have your name please?"
    user.name = check_if_empty_user_input
    computer.name = Computer::CHARACTERS.sample
  end

  def define_markers
    centered "What marker would you like to use?"
    centered "Please choose among uppercase characters (A-Z)."
    user.marker = validate_user_input(*ALPHABET)
    empty_line
    centered "And what marker will you choose to your adversary? (A-Z)"
    computer.marker = validate_user_input(*ALPHABET)
    computer.marker = try_again(ALPHABET) until user.marker != computer.marker
  end

  def define_order_of_players(user_name, computer_name,
                              user_marker, computer_marker)
    # Defaults to Computer as first player
    self.player1 = Computer.new(computer_name, computer_marker)
    self.player2 = Human.new(user_name, user_marker)
    ask_who_goes_first
    choice = validate_user_input('c', 'p', 'r')
    # Change order of players in case user choice demands it
    change_order_of_players(user_name, computer_name,
                            user_marker, computer_marker, choice)
  end

  def acknowledge_players
    puts "Okay, this will be a match of\
 #{player1.name} against #{player2.name}."
    puts "#{player1.name} will start."
    press_enter(BAR_SIZE)
  end

  def clear_and_display_game
    clear_screen
    empty_line
    display_participants
    board.display
    display_score
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
    bannerized "Current score: #{player1.name} #{player1.score}\
 x #{player2.score} #{player2.name}"
    empty_line
  end

  def display_participants
    centered "#{player1.name} is #{player1.marker},\
 #{player2.name} is #{player2.marker}."
  end

  def try_again(alphabet)
    centered "Sorry, markers can't be the same"
    validate_user_input(*alphabet)
  end

  def change_order_of_players(user_name, computer_name,
                              user_marker, computer_marker, choice)
    case choice
    when 'p'
      self.player1, self.player2 = player2, player1
    when 'r'
      randomize_players_order(user_name, computer_name,
                              user_marker, computer_marker)
    end
  end

  def randomize_players_order(user_name, computer_name,
                              user_marker, computer_marker)
    random_order_players = [Human.new(user_name, user_marker),
                            Computer.new(computer_name, computer_marker)]
                           .shuffle!
    self.player1 = random_order_players[0]
    self.player2 = random_order_players[1]
  end

  def display_result
    if board.someone_won?
      print_winner_and_update_score(board.winner_marker)
    else
      puts "It's a tie..."
    end
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    answer = validate_user_input('y', 'n')
    answer == 'y'
  end

  def reset
    @board = Board.new
  end

  def ask_who_goes_first
    empty_line
    centered "Who should play first?"
    centered "(c) for Computer"
    centered "(p) for Player"
    centered "(r) for Random"
    empty_line
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
end

GameEngine.new.play
