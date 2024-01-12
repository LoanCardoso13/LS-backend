# rubocop:disable all
=begin

1) Write a textual description of the problem or exercise.
2) Extract the major nouns and verbs from the description.
3) Organize and associate the verbs with the nouns.
4) The nouns are the classes and the verbs are the behaviors or methods.

1) 
Rock, Paper, Scissors is a two-player game where each player chooses
one of three possible moves: rock, paper, or scissors. The chosen moves
will then be compared to see who wins, according to the following rules:

- rock beats scissors
- scissors beats paper
- paper beats rock

If the players chose the same move, then it's a tie.

2)
nouns: player, move, rule
verbs: choose, compare

=end

class Move
  def initialize
    # seems like we need something to keep track
    # of the choice... a move object can be "paper", "rock" or "scissors"
  end
end

class Rule
  def initialize
    # not sure what the "state" of a rule object should be
  end
end

# not sure where "compare" goes yet
def compare(move1, move2)

end

class Move
  attr_accessor :value
  VALUES = %w( rock paper scissors )

  include Comparable

  def initialize(value)
    @value= value
  end

  def <=>(other_player_move)
    case self.value
    when 'rock'
      return 1 if other_player_move.value == 'scissors'
      return -1 if other_player_move.value == 'paper'
    when 'paper'
      return 1 if other_player_move.value == 'rock'
      return -1 if other_player_move.value == 'scissors'
    when 'scissors'
      return 1 if other_player_move.value == 'paper'
      return -1 if other_player_move.value == 'rock'
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
    self.name= n
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
    self.name= ['R2D2', 'Chappie', 'Robot #5'].sample
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

  def display_winner
    puts "#{human.name} chose #{human.move}."
    puts "The #{computer.name} chose #{computer.move}."
    if human.move > computer.move
      puts "#{human.name} won!" 
    elsif computer.move > human.move
      puts "#{computer.name} won!" 
    else
      puts "It's a tie..." 
    end

    case human.move
    when 'rock'
      puts "It's a tie..." if computer.move == 'rock'
      puts "#{human.name} won!" if computer.move == 'scissors'
      puts "#{computer.name} won!" if computer.move == 'paper'
    when 'paper'
      puts "It's a tie..." if computer.move == 'paper'
      puts "#{human.name} won!" if computer.move == 'rock'
      puts "#{computer.name} won!" if computer.move == 'scissors'
    when 'scissors'
      puts "It's a tie..." if computer.move == 'scissors'
      puts "#{human.name} won!" if computer.move == 'paper'
      puts "#{computer.name} won!" if computer.move == 'rock'
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
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
