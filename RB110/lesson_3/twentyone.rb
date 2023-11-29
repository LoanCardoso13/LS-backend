=begin

1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.

=end

ranks = [ 2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace' ]
deck = { heart: ranks.dup, diamond: ranks.dup, club: ranks.dup, spades: ranks.dup }
score = [0, 0]

def prompt(msg)
  puts "=> #{msg}"
end

def get_total(hand)
  sum = 0
  hand.each do |card|
    sum += card[:value]
  end
  sum
end

def give_random_card(hand, deck)
  suit = deck.keys.sample
  rank = deck[suit].sample 
  deck[suit].delete(rank)
  if (2..10).include?(rank)
    value = rank
  elsif rank == 'ace' && get_total(hand) <= 10
    value = 11
  elsif rank == 'ace'
    value = 1
  else
    value = 10
  end
  { suit => rank, value: value }
end

loop do # Game loop (1 game consists of 2 turns; player's and dealer's, in this order)
  player = []
  dealer = []
  bust = false
  winner = ''
  system 'clear'
  if [1, 2].sample == 1 # Deal cards 
    2.times { |_| player << give_random_card(player, deck); dealer << give_random_card(dealer, deck) }
  else
    2.times { |_| dealer << give_random_card(dealer, deck); player << give_random_card(player, deck) }
  end
  prompt "Welcome to the Twenty-One game!"
  puts
  prompt "The goal of Twenty-One is to try to get as close to 21 as possible, without going over."
  prompt "If you go over 21, it's a 'bust' and you lose."
  puts
  prompt "Dealer has: #{dealer.sample[:value]} and unknown card."
  loop do # Player turn
    prompt "You have: #{player.map { |hsh| hsh[:value] }.join(' and ')}"
    prompt "(H)it or (S)tay?"
    answer = gets.chomp
    break if answer.downcase.start_with?('s')
    player << give_random_card(player, deck)
    prompt "You got a #{player.last[:value]}, your total is now #{get_total(player)}"
    sleep(5)
    if get_total(player) > 21
      prompt "You got 'bust'."
      winner = 'dealer'
      bust = true
      break
    end
  end

  while get_total(dealer) < 17 do # Dealer turn
    prompt "Dealer total is less than 17..."
    sleep(1.3)
    dealer << give_random_card(dealer, deck)
    prompt "Dealer received #{dealer.last}"
    prompt "Dealer now has: #{dealer.map { |hsh| hsh[:value] }.join(' and ')}"
    sleep(5)
    break if get_total(dealer) > 17
    if get_total(dealer) > 21
      prompt "Dealer got 'bust'."
      winner = 'player'
      bust = true
      break
    end
  end

  if bust == false
    prompt "Both dealer and player have decided to stay, and no one got bust"
    prompt "It is now time to compare the cards..."
    prompt "Dealer total is: #{get_total(dealer)}"
    prompt "Player total is: #{get_total(player)}"
    winner = get_total(player) > get_total(dealer) ? 'player' : 'dealer'
  end
  sleep(5)
  prompt "The winner is #{winner}."
  prompt "Play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing twenty-one! Goodbye!"
