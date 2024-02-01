# rubocop:disable all
=begin

Create an object-oriented number guessing class for numbers in the range 1 to 100, with a limit of 7 guesses per game. The game should play like this:

game = GuessingGame.new
game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guess remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!

Note that a game object should start a new game with a new number to guess with each call to #play.

=end

class GuessingGame
  attr_accessor :number_found, :remaining_attempts, :secret_number

  def initialize
    @secret_number = rand(1..100)
    @remaining_attempts = 7
    @number_found = false
  end

  def play
    while remaining_attempts > 0 && number_found == false
      display_remaining_guesses
      guess = ask_user_input
      self.remaining_attempts -= 1
      evaluate_user_input(guess)
    end
    display_result
  end

  def display_remaining_guesses
    if remaining_attempts == 1 
      puts "You have 1 guess remaining."
    else
      puts "You have #{remaining_attempts} guess remaining."
    end
  end

  def ask_user_input
    answer = 0
    loop do
      print "Enter a number between 1 and 100: "
      answer = gets.chomp.to_i 
      break if valid?(answer)
      print "Invalid guess. "
    end
    answer
  end

  def valid?(answer)
    (1..100).include?(answer)
  end

  def evaluate_user_input(num)
    if num > secret_number
      puts "Your guess is too high."
      puts
    elsif num < secret_number
      puts "Your guess is too low."
      puts
    else
      puts "That's the number!"
      puts
      self.number_found = true
    end
  end

  def display_result
    if number_found == true
      puts "You won!"
    elsif remaining_attempts == 0
      puts "You have no more guesses. You lost!"
    end
  end

end

GuessingGame.new.play
