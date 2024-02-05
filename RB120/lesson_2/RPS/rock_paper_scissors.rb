module Playable
  attr_reader :value

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
  VALID_CHOICES = %w(rock paper scissors lizard spock)

  def to_s
    value
  end

  def <=>(other)
    WINNING_SEQUENCES.each do |choices|
      return 1 if choices[0] == value && choices[-1] == other.value
      return -1 if choices[0] == other.value && choices[-1] == value
    end
    0
  end
end

class Move
  attr_reader :choice

  include Comparable

  # rubocop:disable Metrics/MethodLength
  def initialize(choice)
    @choice = case choice
              when 'rock'
                Rock.new
              when 'paper'
                Paper.new
              when 'scissors'
                Scissors.new
              when 'lizard'
                Lizard.new
              when 'spock'
                Spock.new
              end
  end
  # rubocop:enable Metrics/MethodLength
end

class Rock
  include Playable, Comparable

  def initialize
    @value = 'rock'
  end
end

class Paper
  include Playable, Comparable

  def initialize
    @value = 'paper'
  end
end

class Scissors
  include Playable, Comparable

  def initialize
    @value = 'scissors'
  end
end

class Lizard
  include Playable, Comparable

  def initialize
    @value = 'lizard'
  end
end

class Spock
  include Playable, Comparable

  def initialize
    @value = 'spock'
  end
end

class Player
  attr_accessor :name, :score, :moves

  def initialize(name)
    @name = name
    @moves = []
    @score = 0
  end
end

class Human < Player
  attr_reader :move

  def display_options
    parsed_options = parse_options(Playable::VALID_CHOICES)
    puts "#{name}, please choose: #{parsed_options}"
    puts
  end

  def parse_options(options_array)
    "#{options_array[0..-2].join(', ')} or #{options_array[-1]}"
  end

  def make_move
    display_options
    choice = ''
    loop do
      choice = gets.chomp
      break if Playable::VALID_CHOICES.include?(choice)
      puts "Sorry, not a valid choice."
    end
    current_move = Move.new(choice)
    self.move = current_move
    moves << current_move
  end

  private

  attr_writer :move
end

class Computer < Player
  attr_reader :move

  def make_move
    current_move = Move.new(Playable::VALID_CHOICES.sample)
    self.move = current_move
    moves << current_move
  end

  private

  attr_writer :move
end

class RPSgame
  BAR_SIZE = 80

  attr_accessor :human, :computer, :round

  def initialize
    @round = 1
  end

  def naming_participants
    name = user_input_name
    self.human = Human.new(name)
    self.computer = Computer.new(%w(R2D2 Chappie Mr.Roboto AI-jedi).sample)
    puts "Alright, #{human.name}, you'll be playing against #{computer.name}."
    sleep 1.3
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
    system 'clear'
    puts "Welcome to the rock, paper, scissors, lizard and spock game! Enjoy =)"
    puts
    display_rules
    puts
  end

  def display_rules
    puts "In this game, the following rules apply:"
    puts
    Playable::WINNING_SEQUENCES.each do |sequence|
      puts "#{sequence[0].capitalize} #{sequence[1]} #{sequence[2]},"
    end
  end

  def ending_game
    puts
    display_winner
    puts
    display_goodbye
    puts
  end

  def display_winner
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

  def show_rule(h_choice, c_choice)
    puts
    Playable::WINNING_SEQUENCES.each do |sequence|
      if [h_choice, c_choice].include?(sequence[0]) &&
         [h_choice, c_choice].include?(sequence[-1])
        puts "#{sequence[0].capitalize} #{sequence[1]} #{sequence[2]}"
          .center(BAR_SIZE)
      end
    end
    puts
  end

  def display_choices
    [human, computer].each do |player|
      puts "#{player.name} chose #{player.move.choice}."
    end
    sleep 1.3
    show_rule(human.move.choice.value, computer.move.choice.value)
  end

  def calculate_winner
    if human.move.choice > computer.move.choice
      human.score += 1
    elsif human.move.choice < computer.move.choice
      computer.score += 1
    else
      puts "It's a tie..."
    end
  end

  def display_score
    system 'clear'
    display_history
    puts "-" * BAR_SIZE
    puts "Current score is:".center(BAR_SIZE)
    puts "#{human.name}: #{human.score} vs #{computer.name}: #{computer.score}"
      .center(BAR_SIZE)
    puts "-" * BAR_SIZE
  end

  def display_history
    round.times do |round|
      puts "Round #{round}".center(BAR_SIZE)
      puts "#{human.name} chooses #{human.moves[round - 1]}".center(BAR_SIZE)
      puts "#{computer.name} chooses #{computer.moves[round - 1]}".center(BAR_SIZE)
    end
    puts
  end

  # rubocop:disable Metrics/MethodLength
  def play
    display_welcome_message
    naming_participants
    loop do
      display_score
      human.make_move
      computer.make_move
      display_choices
      calculate_winner
      break unless play_again?
      self.round += 1
    end
    ending_game
  end
  # rubocop:enable Metrics/MethodLength
end

RPSgame.new.play
