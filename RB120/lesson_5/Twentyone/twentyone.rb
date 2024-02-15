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

  def check_for_emptiness
    answer = ''
    loop do
      answer = gets.chomp
      break unless answer.strip.empty?
      puts "Sorry, name can't be blank."
    end
    answer
  end

  def press_enter
    puts '[press enter]'.rjust(Displayable::BAR_SIZE)
    gets
  end
end

module Displayable
  BAR_SIZE = 80
  SHIFT_AMOUNT = 30

  def centered(line)
    puts line.center(BAR_SIZE)
  end

  def empty_line
    puts
  end

  def clear_screen
    system 'clear'
  end

  def shifted(line)
    puts "#{' ' * SHIFT_AMOUNT}#{line}"
  end

  def cadence_pause
    sleep 1.3
  end
end

module Hand
  def busted?
    total > 21
  end

  def total
    sum = 0
    sum = total_without_correction(sum)
    correct_for_aces(sum)
  end

  def total_without_correction(sum)
    cards.each do |card|
      sum += if face_value?(card)
               card.rank.to_i
             elsif card.rank == 'Ace'
               11
             else
               10
             end
    end
    sum
  end

  def face_value?(card)
    card.rank.to_i != 0
  end

  def correct_for_aces(sum)
    cards.count { |card| card.rank == 'Ace' }.times do
      break if sum <= 21
      sum -= 10
    end
    sum
  end
end

class Participant
  include Hand, Displayable

  attr_accessor :name, :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def hit_and_show_hand(deck)
    puts "#{name} hits!"
    cards << deck.deal
    show_all_hand
  end

  def stay
    puts "#{name} stays!"
    empty_line
  end

  def show_all_hand
    shifted "---- #{name}'s hand ----"
    cards.each do |card|
      shifted "=> #{card}"
    end
    shifted "=> total: #{total}"
    empty_line
  end
end

class Player < Participant
end

class Dealer < Participant
  CHARACTERS = %w(R2D2 Chappie Mr.Roboto AI-jedi)

  def stay?
    total >= 17
  end

  def show_partial_hand
    shifted "---- #{name}'s hand ----"
    shifted "=> #{cards[0]}"
    shifted "=> ???"
    empty_line
  end
end

class Deck
  SUITS = %w(Clubs Diamonds Hearts Spades)
  RANKS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

  attr_reader :cards

  def initialize
    @cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
    @cards.shuffle!
  end

  def deal
    cards.pop
  end
end

class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Game
  include Displayable, Validatable

  def initialize
    @deck = Deck.new
  end

  def reset
    @deck = Deck.new
    player.cards = []
    dealer.cards = []
  end

  def start
    game_setup
    loop do
      main
      break unless play_again?
      reset
    end
    game_end
  end

  private

  attr_reader :deck

  attr_accessor :player, :dealer

  def game_setup
    display_welcome_message
    assign_names
    acknowledge_game_setup
  end

  def main
    deal_cards
    show_initial_cards
    player_turn
    player.busted? || dealer_turn
    anyone_busted? || compare_cards
    show_result if anyone_busted?
  end

  def game_end
    centered "Thank you for playing Twenty-One today! Hope you had a good time!"
    empty_line
  end

  def play_again?
    centered "Would you like to play again? (y/n)"
    choice = validate_user_input('y', 'n')
    choice == 'y'
  end

  def show_result
    if player.busted?
      centered "Looks like #{player.name} busted! #{dealer.name} wins!"
    elsif dealer.busted?
      centered "Looks like #{dealer.name} busted! #{player.name} wins!"
    end
  end

  def anyone_busted?
    player.busted? || dealer.busted?
  end

  def compare_cards
    centered "It's now time to compare the cards..."
    empty_line
    player.show_all_hand
    dealer.show_all_hand
    cadence_pause
    declare_winner
  end

  def declare_winner
    participants = [player, dealer]
    participants.sort_by!(&:total)
    if participants.map(&:total).uniq.size == 1
      centered "It's a tie..."
    else
      centered "Looks like #{participants[1].name} wins!"
    end
  end

  def dealer_turn
    puts "#{dealer.name}'s turn..."
    dealer_hit_or_stay
  end

  def dealer_hit_or_stay
    loop do
      break if dealer.stay?
      dealer.hit_and_show_hand(deck)
      press_enter
      break if dealer.busted?
    end
    dealer.busted? || dealer.stay
  end

  def player_turn
    puts "#{player.name}'s turn..."
    player_hit_or_stay
  end

  def player_hit_or_stay
    loop do
      puts "Would you like to (h)it or (s)tay?"
      choice = validate_user_input('h', 's')
      break if choice == 's'
      player.hit_and_show_hand(deck)
      break if player.busted?
    end
    player.busted? || player.stay
  end

  def deal_cards
    2.times { player.cards << deck.deal }
    2.times { dealer.cards << deck.deal }
  end

  def show_initial_cards
    clear_screen
    player.show_all_hand
    empty_line
    dealer.show_partial_hand
  end

  def display_welcome_message
    clear_screen
    centered "Welcome to the Twenty-one Game!"
    empty_line
  end

  def assign_names
    centered "May I have your name please?"
    user_name = check_for_emptiness
    self.player = Player.new(user_name)
    self.dealer = Dealer.new(Dealer::CHARACTERS.sample)
  end

  def acknowledge_game_setup
    empty_line
    centered "Alright #{player.name}, you will be the player and \
#{dealer.name} the dealer in this twenty-one game."
    centered "Let's have a clean game and may the best win!"
    press_enter
  end
end

Game.new.start
