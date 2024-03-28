# rubocop:disable all
=begin

In the previous exercise, you wrote a number guessing game that determines a secret number between 1 and 100, and gives the user 7 opportunities to guess the number.

Update your solution to accept a low and high value when you create a GuessingGame object, and use those values to compute a secret number for the game. You should also change the number of guesses allowed so the user can always win if she uses a good strategy. You can compute the number of guesses with:

Math.log2(size_of_range).to_i + 1

Examples:

game = GuessingGame.new(501, 1500)
game.play

You have 10 guesses remaining.
Enter a number between 501 and 1500: 104
Invalid guess. Enter a number between 501 and 1500: 1000
Your guess is too low.

You have 9 guesses remaining.
Enter a number between 501 and 1500: 1250
Your guess is too low.

You have 8 guesses remaining.
Enter a number between 501 and 1500: 1375
Your guess is too high.

You have 7 guesses remaining.
Enter a number between 501 and 1500: 80
Invalid guess. Enter a number between 501 and 1500: 1312
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 501 and 1500: 1343
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 501 and 1500: 1359
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 501 and 1500: 1351
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 501 and 1500: 1355
That's the number!

You won!

game.play
You have 10 guesses remaining.
Enter a number between 501 and 1500: 1000
Your guess is too high.

You have 9 guesses remaining.
Enter a number between 501 and 1500: 750
Your guess is too low.

You have 8 guesses remaining.
Enter a number between 501 and 1500: 875
Your guess is too high.

You have 7 guesses remaining.
Enter a number between 501 and 1500: 812
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 501 and 1500: 843
Your guess is too high.

You have 5 guesses remaining.
Enter a number between 501 and 1500: 820
Your guess is too low.

You have 4 guesses remaining.
Enter a number between 501 and 1500: 830
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 501 and 1500: 835
Your guess is too low.

You have 2 guesses remaining.
Enter a number between 501 and 1500: 836
Your guess is too low.

You have 1 guess remaining.
Enter a number between 501 and 1500: 837
Your guess is too low.

You have no more guesses. You lost!

Note that a game object should start a new game with a new number to guess with each call to #play.

=end


class GuessingGame
  attr_accessor :number_found, :remaining_attempts, :secret_number, :lp, :up

  def initialize(lower_limit, upper_limit)
    @lp = lower_limit
    @up = upper_limit
    @secret_number = rand(lower_limit..upper_limit)
    @remaining_attempts = Math.log2(upper_limit - lower_limit).to_i + 1
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
      print "Enter a number between #{lp} and #{up}: "
      answer = gets.chomp.to_i 
      break if valid?(answer)
      print "Invalid guess. "
    end
    answer
  end

  def valid?(answer)
    (lp..up).include?(answer)
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

game = GuessingGame.new(501, 1500)
game.play
