module Validatable
  def validate_user_input(*validators)
    answer = ''
    loop do
      answer = gets.chomp.downcase
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
  def cadence_pause
    sleep 1.3
  end

  def clear_screen
    system 'clear'
  end

  def empty_line
    puts
  end
end

class Move
  WINNING_SEQUENCES = [
    ['scissors', 'cuts', 'paper'],
    ['paper', 'covers', 'rock'],
    ['rock', 'crushes', 'lizard'],
    ['lizard', 'poisons', 'spock'],
    ['spock', 'smashes', 'scissors'],
    ['scissors', 'decapitates', 'lizard'],
    ['lizard', 'eats', 'paper'],
    ['paper', 'disproves', 'spock'],
    ['spock', 'vaporizes', 'rock'],
    ['rock', 'crushes', 'scissors']
  ]

  attr_reader :value

  include Comparable

  def initialize(value)
    @value = value
  end

  def to_s
    value
  end

  def <=>(other)
    # Comparison works by checking if both player's choices appear in a winning
    # sequence and, if they do, return 1 or -1 to define who wins and loses
    WINNING_SEQUENCES.each do |choices|
      return 1 if choices[0] == value && choices[-1] == other.value
      return -1 if choices[0] == other.value && choices[-1] == value
    end
    0
  end
end

class Player
  CORE_MOVES = %w(rock paper scissors lizard spock)
  CORE_MOVES_UI = %w((r)rock (p)aper (sc)issors (l)izard (sp)ock)
  VALID_CHOICES = {}
  CORE_MOVES.size.times do |idx|
    VALID_CHOICES[CORE_MOVES_UI[idx]] = CORE_MOVES[idx]
  end

  attr_accessor :name, :score, :moves

  def initialize(name)
    @name = name
    @moves = []
    @score = 0
  end
end

class Human < Player
  include Validatable, Displayable

  def display_options
    parsed_options = parse_options(VALID_CHOICES.keys)
    puts "#{name}, please choose: #{parsed_options}"
    empty_line
  end

  def parse_options(options_array)
    "#{options_array[0..-2].join(', ')} or #{options_array[-1]}"
  end

  def make_move
    display_options
    user_input = validate_user_input('r', 'p', 'sc', 'l', 'sp')
    choice = VALID_CHOICES.values.select do |value|
      value.start_with?(user_input)
    end[0]
    current_move = Move.new(choice)
    moves << current_move
  end
end

class Computer < Player
  CHARACTERS = %w(R2D2 Chappie Mr.Roboto AI-jedi)
  WHEIGHTS = [
    [50, 25, 10, 10, 5],
    [25, 10, 10, 25, 30],
    [10, 20, 30, 40, 0],
    [20, 20, 20, 20, 20]
  ]
  # Choices profile for each character, wheighted by percentage
  PROFILES = {}
  CHARACTERS.size.times do |idx|
    PROFILES[CHARACTERS[idx]] = WHEIGHTS[idx]
  end

  def define_choices(character)
    character_choices = []
    VALID_CHOICES.values.each_with_index do |choice, idx|
      character_choices << ([choice] * PROFILES[character.name][idx])
    end
    character_choices.flatten
  end

  def make_move
    choices = define_choices(self)
    current_move = Move.new(choices.sample)
    moves << current_move
  end
end

class RPSgame
  BAR_SIZE = 80

  include Validatable, Displayable

  def initialize
    @round_limit = nil
  end

  def play
    game_setup
    if round_limit?
      bounded_game
    else
      unbounded_game
    end
    end_game
  end

  private

  attr_accessor :human, :computer, :round_limit

  def naming_participants
    puts "Before we begin, what's your name plase?"
    user_name = check_if_empty_user_input
    self.human = Human.new(user_name)
    self.computer = Computer.new(Computer::CHARACTERS.sample)
    empty_line
  end

  def ask_number_of_rounds
    puts "Would you like to set a limit of rounds to declare the winner? (y/n)"
    answer = validate_user_input('y', 'n')
    if answer == 'y'
      puts "How many rounds would you like to play?"
      self.round_limit = validate_user_input(*((1..100).to_a.map(&:to_s)))
    end
    empty_line
  end

  def round_limit?
    !!round_limit
  end

  def acknowledge_setup
    puts "Alright, #{human.name}, you'll be playing against #{computer.name}."
    puts "There will be a total of #{round_limit} round(s)." if round_limit?
    press_enter(BAR_SIZE)
  end

  def display_welcome_message
    clear_screen
    puts "Welcome to the rock, paper, scissors, lizard and spock game! Enjoy =)"
    empty_line
  end

  def display_rules
    puts "In this game, the following rules apply:"
    empty_line
    # The WINNING_SEQUENCES sub arrays follow a pattern of
    # Noun verb noun and can be displayed iteratively
    # To announce the rules of the game:
    Move::WINNING_SEQUENCES.each do |sequence|
      puts "#{sequence[0].capitalize} #{sequence[1]} #{sequence[2]},"
    end
    empty_line
  end

  def end_game
    empty_line
    display_overall_winner
    empty_line
    display_goodbye
    empty_line
  end

  def display_overall_winner
    if human.score > computer.score
      puts "#{human.name} was the winner".center(BAR_SIZE)
    elsif human.score < computer.score
      puts "#{computer.name} was the winner".center(BAR_SIZE)
    end
  end

  def display_goodbye
    puts "Thanks for playing rock, paper, scissors, lizard and spock!"
    puts "Hope you had a good time!"
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    answer = validate_user_input('y', 'n')
    answer == 'y'
  end

  def display_winning_rule(h_move, c_move)
    empty_line
    Move::WINNING_SEQUENCES.each do |sequence|
      if [h_move.value, c_move.value].include?(sequence[0]) &&
         [h_move.value, c_move.value].include?(sequence[-1])
        puts "#{sequence[0].capitalize} #{sequence[1]} #{sequence[2]}"
          .center(BAR_SIZE)
      end
    end
    empty_line
  end

  def display_choices
    [human, computer].each do |player|
      puts "#{player.name} chose #{player.moves.last}."
    end
    cadence_pause
  end

  def calculate_match_winner
    if human.moves.last > computer.moves.last
      human.score += 1
    elsif human.moves.last < computer.moves.last
      computer.score += 1
    end
  end

  def display_score
    puts "-" * BAR_SIZE
    puts "Current score is:".center(BAR_SIZE)
    puts "#{human.name}: #{human.score} vs #{computer.name}: #{computer.score}"
      .center(BAR_SIZE)
    puts "-" * BAR_SIZE
  end

  def display_history
    clear_screen
    return if human.moves.empty?
    human.moves.each_with_index do |human_move, idx|
      puts "Round #{idx + 1}: \
#{human.name} chose #{human_move} and \
#{computer.name} chose #{computer.moves[idx]}."
    end
    empty_line
  end

  def bounded_game
    round_limit.to_i.times do
      main_game
      press_enter(BAR_SIZE)
    end
  end

  def unbounded_game
    loop do
      main_game
      break unless play_again?
    end
  end

  def game_setup
    display_welcome_message
    display_rules
    naming_participants
    ask_number_of_rounds
    acknowledge_setup
  end

  def main_game
    display_history
    display_score
    human.make_move
    computer.make_move
    display_choices
    display_winning_rule(human.moves.last, computer.moves.last)
    calculate_match_winner || (puts "It's a tie...")
  end
end

RPSgame.new.play
