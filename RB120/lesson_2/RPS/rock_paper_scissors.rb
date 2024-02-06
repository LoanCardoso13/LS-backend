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

# class Rock
#   include Playable, Comparable
#
#   def initialize
#     @value = 'rock'
#   end
# end
#
# class Paper
#   include Playable, Comparable
#
#   def initialize
#     @value = 'paper'
#   end
# end
#
# class Scissors
#   include Playable, Comparable
#
#   def initialize
#     @value = 'scissors'
#   end
# end
#
# class Lizard
#   include Playable, Comparable
#
#   def initialize
#     @value = 'lizard'
#   end
# end
#
# class Spock
#   include Playable, Comparable
#
#   def initialize
#     @value = 'spock'
#   end
# end

class Player
  VALID_CHOICES = %w(rock paper scissors lizard spock)

  attr_accessor :name, :score, :moves

  def initialize(name)
    @name = name
    @moves = []
    @score = 0
  end
end

class Human < Player
  def display_options
    parsed_options = parse_options(VALID_CHOICES)
    puts "#{name}, please choose: #{parsed_options}"
    puts
  end

  def parse_options(options_array)
    "#{options_array[0..-2].join(', ')} or #{options_array[-1]}"
  end

  def user_input_choice
    choice = ''
    loop do
      choice = gets.chomp
      break if VALID_CHOICES.include?(choice)
      puts "Sorry, not a valid choice."
    end
    choice
  end

  def make_move
    display_options
    choice = user_input_choice
    current_move = Move.new(choice)
    moves << current_move
  end
end

class Computer < Player
  CHARACTERS = %w(R2D2 Chappie Mr.Roboto AI-jedi)
  # Choices profile for each character, wheighted by percentage
  PROFILES = { 'R2D2' => [50, 25, 10, 10, 5],
               'Chappie' => [25, 10, 10, 25, 30],
               'Mr.Roboto' => [10, 20, 30, 40, 0],
               'AI-jedi' => [20, 20, 20, 20, 20] }

  def define_choices(character)
    character_choices = []
    VALID_CHOICES.each_with_index do |choice, idx|
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

  attr_accessor :human, :computer

  def naming_participants
    user_name = user_input_name
    self.human = Human.new(user_name)
    self.computer = Computer.new(Computer::CHARACTERS.sample)
    puts "Alright, #{human.name}, you'll be playing against #{computer.name}."
  end

  def user_input_name
    name = ''
    loop do
      puts "Before we begin, what's your name plase?"
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, name can't be blank."
    end
    name
  end

  def display_welcome_message
    puts "Welcome to the rock, paper, scissors, lizard and spock game! Enjoy =)"
  end

  def display_rules
    puts "In this game, the following rules apply:"
    puts
    Move::WINNING_SEQUENCES.each do |sequence|
      puts "#{sequence[0].capitalize} #{sequence[1]} #{sequence[2]},"
    end
  end

  def end_game
    puts
    display_overall_winner
    puts
    display_goodbye
    puts
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
    answer = ''
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if %w(y n).include? answer.downcase
      puts "Sorry, not valid input. Gotta choose: (y,n)"
    end
    answer == 'y'
  end

  def display_winning_rule(h_move, c_move)
    puts
    Move::WINNING_SEQUENCES.each do |sequence|
      if [h_move.value, c_move.value].include?(sequence[0]) &&
         [h_move.value, c_move.value].include?(sequence[-1])
        puts "#{sequence[0].capitalize} #{sequence[1]} #{sequence[2]}"
          .center(BAR_SIZE)
      end
    end
    puts
  end

  def display_choices
    [human, computer].each do |player|
      puts "#{player.name} chose #{player.moves.last}."
    end
    sleep 1.3
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
    return if human.moves.empty?
    human.moves.each_with_index do |human_move, idx|
      print "Round #{idx + 1}: "
      print "#{human.name} chose #{human_move} and "
      puts "#{computer.name} chose #{computer.moves[idx]}."
    end
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def play
    system 'clear'
    display_welcome_message
    puts
    display_rules
    puts
    naming_participants
    sleep 1.3
    loop do
      system 'clear'
      display_history
      puts
      display_score
      human.make_move
      computer.make_move
      display_choices
      display_winning_rule(human.moves.last, computer.moves.last)
      calculate_match_winner || (puts "It's a tie...")
      break unless play_again?
    end
    end_game
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
end

RPSgame.new.play
