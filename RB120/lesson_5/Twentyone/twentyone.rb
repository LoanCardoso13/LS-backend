module SystemOperations
  def check_validity(answer, *checks)
    answer.downcase!
    loop do
      break if answer.start_with?(*checks)

      puts 'Sorry, not a valid answer.'
    end
  end

  def clear_screen
    system 'clear'
  end
end

class Participant
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def hit(deck)
    hand << deck.deal
  end

  def show_hand
    hand[0..-2].map(&:to_s).join(', ') + ' and ' + hand.last.to_s
  end

  def busted?
    total > 21
  end

  def total
    while evaluate_hand > 21 && hand.map(&:rank).include?('ace')
      hand.each do |card|
        if card.suit == 'ace'
          card.suit = 'ace-'
          break
        end
      end
    end
    evaluate_hand
  end

  def evaluate_hand
    hand.map(&:value).sum
  end
end

class Player < Participant
  def hit(deck)
    super(deck)
    puts "You got a #{hand.last}."
  end
end

class Dealer < Participant
  def hit(deck)
    super(deck)
    puts "Dealer received a #{hand.last}"
  end

  def stay
    puts "Dealer also decided to stay."
  end
end

class Deck
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']
  SUITS = %w(hearts diamonds clubs spades)

  attr_reader :cards

  def initialize
    @cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
  end

  def deal
    cards.shuffle!
    cards.pop
  end
end

class Card
  attr_reader :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def value
    if rank.class == Integer
      rank
    elsif rank == 'ace'
      11
    elsif rank == 'ace-'
      1
    else
      10
    end
  end

  def to_s
    rank.to_s + ' of ' + suit
  end
end

class Game
  attr_accessor :deck, :player, :dealer

  include SystemOperations

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def start
    welcome_message
    main_game
    goodbye_message
  end

  def main_game
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn unless player.busted?
    compare_cards unless (dealer.busted? || player.busted?)
  end

  def welcome_message
    clear_screen
    puts 'Welcome to the Twenty-One game!'
    puts "If you go over 21, it's a 'bust' and you lose."
    puts
  end

  def goodbye_message
    puts
    puts "Thanks for playing TwentyOne! See ya!"
  end

  def deal_cards
    2.times do
      player.hand << deck.deal
      dealer.hand << deck.deal
    end
  end

  def show_initial_cards
    puts "Dealer has a #{dealer.hand[0]} and unknown card."
    show_player_cards
  end

  def show_player_cards
    puts "You have: #{player.show_hand}. Your total is #{player.total}."
  end

  def show_dealer_cards
    puts "Dealer now has: #{dealer.show_hand}. His total is #{dealer.total}"
  end

  def player_turn
    loop do
      puts '(H)it or (S)tay?'
      answer = gets.chomp.downcase
      check_validity(answer, 'h', 's')

      player.hit(deck) if answer.start_with?('h')
      show_player_cards
      break if answer.start_with?('s') || player.busted?
    end
    puts "You got busted!" if player.busted?
  end

  def dealer_turn
    total = dealer.total
    while total < 17
      puts "Dealer total is less than 17, he decides to hit..."
      sleep 1.3
      dealer.hit(deck)
      sleep 1.3
      show_dealer_cards
      sleep 1.3
      total = dealer.total
    end
    puts "Dealer busted! You win!" if dealer.busted?
    dealer.stay unless dealer.busted?
  end

  def compare_cards
    puts "It is now time to compare the cards..."
    sleep 1.3
    show_dealer_cards
    sleep 1.3
    show_player_cards
    sleep 1.3
    if player.total > dealer.total
      puts "You won!"
    elsif player.total < dealer.total
      puts "You lost!"
    else
      puts "It's a tie..."
    end
  end
end

Game.new.start
