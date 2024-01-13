class Move
  attr_accessor :value

  VALUES = %w(rock paper scissors)
  WINNING_SEQUENCES = [
    ['rock', 'scissors'],
    ['scissors', 'paper'],
    ['paper', 'rock']
  ]

  include Comparable

  def initialize(value)
    @value = value
  end

  def <=>(other_player_move)
    WINNING_SEQUENCES.each do |win_move, lose_move|
      return 1 if value == win_move && other_player_move.value == lose_move
      return -1 if other_player_move.value == win_move && value == lose_move
    end
    0
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value"
    end
    self.name = n
  end

  def choose
    choice = ''
    loop do
      puts "Please choose rock, paper or scissors:"
      choice = gets.chomp
      break if (Move::VALUES).include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Chappie', 'Robot #5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Goodbye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "The #{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie..."
    end
  end

  def play_again?
    answer = ''
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must choose (y) or (n)."
    end
    answer.downcase == 'y'
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
