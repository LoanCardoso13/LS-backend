# rubocop:disable Layout/LineLength
module Rules
  def rules1
    centered "The game consists of a 'dealer' and a 'player'."
    spaced_cadence
    centered "Both participants are initially dealt 2 cards."
    spaced_cadence
    centered "The player can see their 2 cards, but can only see one of the dealer's cards."
  end

  def rules2
    centered "The goal of Twenty-One is to try to get as close to 21 as possible, without going over."
    spaced_cadence
    centered "If you go over 21, it's a 'bust' and you lose."
    spaced_cadence
    centered "All of the card values are pretty straightforward, except for the ace."
  end

  def rules3
    centered "The numbers 2 through 10 are worth their face value."
    spaced_cadence
    centered "The jack, queen, and king are each worth 10, and the ace can be worth 1 or 11:"
    spaced_cadence
    shifted "Card               Value"
    shifted "2-10               face value"
    shifted "jack, queen, king  10"
    shifted "ace                1 or 11"
  end

  def rules4
    centered "The ace's value is determined each time a new card is drawn from the deck."
    spaced_cadence
    centered "For example, if the hand contains a 2, an ace, and a 5, then the total value of the hand is 18."
    spaced_cadence
    centered "In this case, the ace is worth 11 because the sum of the hand (2 + 11 + 5) doesn't exceed 21"
  end

  def rules5
    centered "Now, say another card is drawn and it happens to be an ace."
    spaced_cadence
    centered "If the sum of the hand (2 + 11 + 5 + 11) exceeds 21 then..."
    spaced_cadence
    centered "one of the aces must be worth 1, resulting in the hand's total value being 19."
  end

  def rules6
    centered "Each ace default value is 11, but it can turn into 1 if..."
    spaced_cadence
    centered "the total value of the hand exceeds 21."
    spaced_cadence
    centered "A hand can have aces worth different values."
  end
end
# rubocop:enable Layout/LineLength

module GameMessages
  include Rules

  def participant_hit_message(name)
    puts "#{name} hits!"
  end

  def participant_stay_message(name)
    puts "#{name} stays!"
  end

  def hit_or_stay_message
    puts "Would you like to (h)it or (s)tay?"
  end

  def farewell_message
    centered "Thank you for playing Twenty-One today! Hope you had a good time!"
  end

  def play_again_message
    centered "Would you like to play again? (y/n)"
  end

  def who_got_busted_message(busted_name, winner_name)
    centered "Looks like #{busted_name} busted! #{winner_name} wins!"
  end

  def view_rules_message
    centered "Would you like to view the rules of the game? (y/n)"
  end

  def view_rules_again?
    centered "Would you like to review the rules? (y/n)"
    choice = validate_user_input('y', 'n')
    choice.downcase[0] == 'y'
  end

  def display_rules
    loop do
      [:rules1, :rules2, :rules3, :rules4, :rules5, :rules6].each do |rule|
        clear_screen
        empty_line
        send rule
        press_enter
      end
      break unless view_rules_again?
    end
    clear_screen
  end

  def comparing_cards_message
    centered "It's now time to compare the cards..."
  end

  def tie_result_message
    centered "It's a tie..."
  end

  def name_winner_message(name)
    centered "Looks like #{name} wins!"
  end

  def who_turn_is_message(name)
    puts "#{name}'s turn..."
  end

  def welcome_message
    centered "Welcome to the Twenty-one Game!"
  end

  def ask_name_message
    centered "May I have your name please?"
  end
end

module Validatable
  def validate_user_input(*validators)
    answer = ''
    loop do
      answer = gets.chomp.downcase
      break if answer.start_with?(*validators)
      puts "Sorry, invalid input."
    end
    answer
  end

  def check_for_emptiness
    answer = ''
    loop do
      answer = gets.chomp
      break unless answer.strip.empty?
      puts "Sorry, input can't be blank."
    end
    answer
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

  def press_enter
    puts '[press enter]'.rjust(Displayable::BAR_SIZE)
    gets
  end

  def shifted(line)
    puts "#{' ' * SHIFT_AMOUNT}#{line}"
  end

  def cadence_pause
    sleep 1.3
  end

  def spaced_cadence
    cadence_pause
    empty_line
  end
end

module Hand
  include Displayable

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
             elsif card.rank == 'A'
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
    cards.count { |card| card.rank == 'A' }.times do
      break if sum <= 21
      sum -= 10
    end
    sum
  end

  # rubocop:disable Metrics/AbcSize
  def display_cards
    puts([
      "+-----+ " * cards.size,
      cards.map { |card| "|#{card.suit.ljust(5)}|" }.join(' '),
      cards.map { |card| "|#{card.rank.center(5)}|" }.join(' '),
      cards.map { |card| "|#{card.suit.rjust(5)}|" }.join(' '),
      "+-----+ " * cards.size
    ].map { |line| line.center(Displayable::BAR_SIZE) })
  end

  def display_but_one_card
    puts([
      "+-----+ " * 2,
      "|#{cards[0].suit.ljust(5)}| |?    |",
      "|#{cards[0].rank.center(5)}| |  ?  |",
      "|#{cards[0].suit.rjust(5)}| |    ?|",
      "+-----+ " * 2
    ].map { |line| line.center(Displayable::BAR_SIZE) })
  end
  # rubocop:enable Metrics/AbcSize
end

class Participant
  include Hand, Displayable, Validatable, GameMessages

  attr_accessor :name, :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def hit_and_show_hand(deck)
    clear_screen
    participant_hit_message(name)
    cards << deck.deal
    show_all_hand
  end

  def stay
    participant_stay_message(name)
    empty_line
    press_enter
  end

  def show_all_hand
    shifted "---- #{name}'s hand ----"
    display_cards
    empty_line
    centered "total: #{total}"
  end
end

class Player < Participant
  def hit_or_stay(deck)
    loop do
      hit_or_stay_message
      choice = validate_user_input('h', 's')
      break if choice.downcase[0] == 's'
      hit_and_show_hand(deck)
      break if busted?
    end
    busted? || stay
  end
end

class Dealer < Participant
  CHARACTERS = %w(R2D2 Chappie Mr.Roboto AI-jedi)

  def stay?
    total >= 17
  end

  def hit_or_stay(deck)
    loop do
      break if stay?
      hit_and_show_hand(deck)
      press_enter
      break if busted?
    end
    busted? || stay
  end

  def show_partial_hand
    shifted "---- #{name}'s hand ----"
    display_but_one_card
    empty_line
    centered "total: ???"
  end
end

class Deck
  SUITS = ['H', 'D', 'S', 'C']
  RANKS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

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
    # "#{rank} of #{suit}"
    ["+-----+",
     "|#{suit.ljust(5)}|",
     "|#{rank.center(5)}|",
     "|#{suit.rjust(5)}|",
     "+-----+"].join("\n")
  end
end

class Game
  include Displayable, Validatable, GameMessages

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
    clear_and_display_welcome_message
    display_rules if see_rules?
    assign_names
    @@participants = [player, dealer]
    acknowledge_game_setup
  end

  def main
    deal_initial_cards
    clear_and_show_initial_cards
    game_turn(player)
    player.busted? || game_turn(dealer)
    anyone_busted? || compare_cards
    show_who_got_busted if anyone_busted?
  end

  def game_end
    farewell_message
    empty_line
  end

  def play_again?
    play_again_message
    choice = validate_user_input('y', 'n')
    choice.downcase[0] == 'y'
  end

  def show_who_got_busted
    busted_name = player.busted? ? player.name : dealer.name
    winner_name = dealer.busted? ? player.name : dealer.name
    who_got_busted_message(busted_name, winner_name)
  end

  def anyone_busted?
    player.busted? || dealer.busted?
  end

  def compare_cards
    comparing_cards_message
    cadence_pause
    clear_screen
    @@participants.each do |participant|
      empty_line
      participant.show_all_hand
      cadence_pause
    end
    declare_winner
  end

  def declare_winner
    @@participants.sort_by!(&:total)
    if @@participants.map(&:total).uniq.size == 1
      tie_result_message
    else
      name_winner_message(@@participants[1].name)
    end
  end

  def game_turn(participant)
    who_turn_is_message(participant.name)
    cadence_pause
    participant.hit_or_stay(deck)
  end

  def deal_initial_cards
    2.times { player.cards << deck.deal }
    2.times { dealer.cards << deck.deal }
  end

  def clear_and_show_initial_cards
    clear_screen
    empty_line
    player.show_all_hand
    empty_line
    dealer.show_partial_hand
  end

  def clear_and_display_welcome_message
    clear_screen
    welcome_message
    empty_line
  end

  def see_rules?
    view_rules_message
    choice = validate_user_input('y', 'n')
    choice.downcase[0] == 'y'
  end

  def assign_names
    empty_line
    ask_name_message
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
