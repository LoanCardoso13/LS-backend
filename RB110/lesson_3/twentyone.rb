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
player = { heart: [], diamond: [], club: [], spades: [] }
dealer = { heart: [], diamond: [], club: [], spades: [] }
player_total = 0
dealer_total = 0
bust = false
winner = ''

def prompt(msg)
  puts "=> #{msg}"
end

def accrued_value(card)
  if (2..10).include?(card)
    return card
  elsif card == 'ace'
    return 1
  elsif card == 'ace+'
    return 11
  else
    return 10
  end
end

def get_total(hand)
  sum = 0
  hand.values.flatten.each do |card|
    sum += accrued_value(card)
  end
  sum
end

def give_random_card(hand, deck)
  suit = deck.keys.sample
  rank = deck[suit].sample 
  deck[suit].delete(rank)
  if rank == 'ace' && get_total(hand) <= 10
    rank << '+'
  end
  hand[suit] << rank
end

if [1, 2].sample == 1 # Deal cards
  2.times { |_| give_random_card(player, deck); give_random_card(dealer, deck) }
else
  2.times { |_| give_random_card(dealer, deck); give_random_card(player, deck) }
end

loop do # Game loop (1 game consists of 2 turns; player's and dealer's, in this order)
  until bust == true do # Player turn
    prompt "Dealer has: #{dealer.values.flatten.sample} and unknown card."
    prompt "You have: #{player.values.flatten.join(' and ')}"
    prompt "(H)it or (S)tay?"
    answer = gets.chomp
    break if answer.downcase.start_with?('s')
    give_random_card(player, deck)
    player_total = get_total(player)
    bust = true if player_total > 21
  end
  if bust == true
    winner = 'dealer'
    break
  end

  while dealer_total <= 17 do # Dealer turn
    prompt "Dealer total is less than 17..."
    sleep(1.3)
    give_random_card(dealer, deck)
    dealer_total = get_total(dealer)
    prompt "Dealer now has: #{dealer.values.flatten.join(' and ')}"
    bust = true if dealer_total > 21
  end
  if bust == true
    winner = 'player'
    break
  end

  winner = get_total(player) > get_total(dealer) ? 'player' : 'dealer'
end

prompt "The winner is #{winner}."

