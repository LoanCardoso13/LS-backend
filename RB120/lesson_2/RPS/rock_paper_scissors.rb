class Move
  attr_reader :value

  VALID_CHOICES = %w(rock paper scissors lizard spock)
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

  include Comparable

  def initialize(value)
    @value = value
  end

  def <=>(other)
    WINNING_SEQUENCES.each do |choices|
      return 1 if choices[0] == value && choices[-1] == other.value
      return -1 if choices[0] == other.value && choices[-1] == value
    end
    0
  end
end

class Player
  attr_accessor :name, :score

  def initialize(name)
    @name = name
    @score = 0
  end
end

class Human < Player
  attr_reader :move

  def display_options
    parsed_options = parse_options(Move::VALID_CHOICES)
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
      break if Move::VALID_CHOICES.include?(choice)
      puts "Sorry, not a valid choice."
    end
    self.move = Move.new(choice)
  end

  private

  attr_writer :move
end

class Computer < Player
  attr_reader :move

  def make_move
    self.move = Move.new(Move::VALID_CHOICES.sample)
  end

  private

  attr_writer :move
end

class RPSgame
  BAR_SIZE = 80

  attr_accessor :human, :computer

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
    Move::WINNING_SEQUENCES.each do |sequence|
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
    puts "Thanks for playing rock, paper scissors, lizard and spock!"
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
    Move::WINNING_SEQUENCES.each do |sequence|
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
      puts "#{player.name} chose #{player.move.value}."
    end
    sleep 1.3
    show_rule(human.move.value, computer.move.value)
  end

  def calculate_winner
    display_choices
    if human.move > computer.move
      human.score += 1
    elsif human.move < computer.move
      computer.score += 1
    else
      puts "It's a tie..."
    end
  end

  def display_score
    system 'clear'
    puts "-" * BAR_SIZE
    puts "Current score is:".center(BAR_SIZE)
    puts "#{human.name}: #{human.score} vs #{computer.name}: #{computer.score}"
      .center(BAR_SIZE)
    puts "-" * BAR_SIZE
  end

  def play
    display_welcome_message
    naming_participants
    loop do
      display_score
      human.make_move
      computer.make_move
      calculate_winner
      break unless play_again?
    end
    ending_game
  end
end

RPSgame.new.play
