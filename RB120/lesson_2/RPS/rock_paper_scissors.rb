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
    options = Move::VALID_CHOICES
    puts "Please choose: #{options[0..-2].join(', ')} or #{options[-1]}"
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
  attr_accessor :human, :computer

  def naming_participants
    name = ''
    loop do
      puts "To kick things off, what's your name plase?"
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, name can't be blank."
    end
    self.human = Human.new(name)
    self.computer = Computer.new(%w(R2D2 Chappie Mr.Roboto AI-jedi).sample)
    puts "Alright, #{human.name}, you'll be playing against #{computer.name}."
  end

  def display_welcome_message
    puts "Welcome to the rock, paper, scissors, lizard
and spock game! I hope you enjoy it =)"
    puts
    puts "In this game, the following rules apply:"
    puts
    Move::WINNING_SEQUENCES.each do |sequence|
      puts "#{sequence[0].capitalize} #{sequence[1]} #{sequence[2]},"
    end
    puts
  end

  def display_farewell_message
    puts "#{human.name} was the winner" if human.score > computer.score
    puts "#{computer.name} was the winner" if human.score < computer.score
    puts "Thanks for playing rock, paper and scissors!"
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
    bar_size = 80
    puts "-" * bar_size
    puts "Current score is:".center(bar_size)
    puts "#{human.name}: #{human.score} vs #{computer.name}: #{computer.score}"
      .center(bar_size)
    puts "-" * bar_size
  end

  # rubocop:disable Metrics/MethodLength
  def play
    display_welcome_message
    naming_participants
    loop do
      human.make_move
      computer.make_move
      calculate_winner
      display_score
      break unless play_again?
    end
    display_farewell_message
  end
  # rubocop:enable Metrics/MethodLength
end

RPSgame.new.play
