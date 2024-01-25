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

  # returns threating to win marker's position or nil
  # def imminent_threat
    # WINNING_LINES.each do |line|
      # squares = @squares.values_at(*line)
      # if two_identical_markers?(squares)
        # target_sqr = (squares - squares.select(&:marked?))[0]
        # return @squares.key(target_sqr)
      # end
    # end
    # nil
  # end

  def calculate_score
    if winner_marker == TTTGame::HUMAN_MARKER
      score[0] += 1
    elsif winner_marker == TTTGame::COMPUTER_MARKER
      score[1] += 1
    end
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  # def two_identical_markers?(squares)
    # markers = squares.select(&:marked?).map(&:marker)
    # return false if markers.length != 2
    # markers.uniq.size == 1
  # end

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

  def human_marked?
    marker == TTTGame::HUMAN_MARKER
  end

  def computer_marked?
    marker == TTTGame::COMPUTER_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def strategy(board)
    if immediate_win?(board)
      immediate_win_pos(board)
    elsif immediate_threat?(board)
      immediate_threat_pos(board)
    else
      board.squares.select { |_, sqr| sqr.unmarked? }.keys.sample
    end
  end

  def immediate_win?(board)
    !!immediate_win_pos(board)
  end

  def immediate_threat?(board)
    !!immediate_threat_pos(board)
  end

  def immediate_win_pos(board)
    Board::WINNING_LINES.each do |line|
      squares = board.squares.values_at(*line)
      if opportunity_to_win?(squares)
        target_sqr = (squares - squares.select(&:computer_marked?))[0]
        return board.squares.key(target_sqr)
      end
    end
    nil
  end

  def immediate_threat_pos(board)
    Board::WINNING_LINES.each do |line|
      squares = board.squares.values_at(*line)
      if threat?(squares)
        target_sqr = (squares - squares.select(&:human_marked?))[0]
        return board.squares.key(target_sqr)
      end
    end
    nil
  end

  def opportunity_to_win?(squares)
    markers = squares.select(&:computer_marked?).map(&:marker)
    return false if markers.length != 2
    markers.uniq.size == 1
  end

  def threat?(squares)
    markers = squares.select(&:human_marked?).map(&:marker)
    return false if markers.length != 2
    markers.uniq.size == 1
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
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

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
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
    computer_mark_position = computer.strategy(board)
    require 'pry'; require 'pry-byebug'; binding.pry
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
    board.calculate_score
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
