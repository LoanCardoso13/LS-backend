RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']
score = { Player: 0, Dealer: 0 }

def prompt(msg)
  puts "=> #{msg}"
end

def hit_or_stay?
  loop do
    answer = gets.chomp
    if answer.downcase.start_with?('h')
      break false
    elsif answer.downcase.start_with?('s')
      break true
    else
      prompt "Not a valid answer..."
      prompt "(H)it or (S)tay?"
    end
  end
end

def compare_cards(player, dealer)
  if get_total(player) > get_total(dealer)
    'Player'
  elsif get_total(dealer) > get_total(player)
    'Dealer'
  else
    prompt "It's a tie.."
    'tie'
  end
end

def get_total(hand)
  sum = 0
  hand.each do |card|
    sum += card[:value]
  end
  sum
end

def display_cards(hand)
  if hand.instance_of?(Hash)
    "#{hand.values[0]} of #{hand.keys[0]}"
  else
    arr = hand.map { |card| "#{card.values[0]} of #{card.keys[0]}" }
    arr[0...(arr.length - 1)].join(', ') + " and #{arr.last}"
  end
end

def give_random_card(hand, deck)
  suit = deck.keys.sample
  rank = deck[suit].sample
  deck[suit].delete(rank)
  value = if (2..10).include?(rank)
            rank
          elsif rank == 'ace' && get_total(hand) <= 10
            11
          elsif rank == 'ace'
            1
          else
            10
          end
  { suit => rank, :value => value }
end

loop do # Game loop (1 game consists of player and dealer turns)
  deck = { hearts: RANKS.dup, diamonds: RANKS.dup, clubs: RANKS.dup, spades: RANKS.dup } # Reshuffling
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
  prompt "The goal of Twenty-One is to try to get as close to 21 as possible, without going over."
  prompt "If you go over 21, it's a 'bust' and you lose."
  puts
  prompt "Current score: Player #{score[:Player]} x #{score[:Dealer]} Dealer."
  puts
  dealer_card = dealer.sample # Sample removed from line below so that it can be taken once only
  prompt "Dealer has a #{display_cards(dealer_card)} (value: #{dealer_card[:value]}) and unknown card."

  loop do # Player turn
    prompt "You have: #{display_cards(player)}. Your total is #{get_total(player)}."
    prompt "(H)it or (S)tay?"
    break if hit_or_stay?
    player << give_random_card(player, deck)
    prompt "You got a #{display_cards(player.last)}."
    sleep(1)
    if get_total(player) > 21
      prompt "You got 'bust'."
      winner = 'Dealer'
      bust = true
      break
    end
  end

  while get_total(dealer) < 17 && bust == false # Dealer turn
    prompt "Dealer total is less than 17, so he decides to hit..."
    sleep(1)
    dealer << give_random_card(dealer, deck)
    prompt "Dealer received #{display_cards(dealer.last)}"
    prompt "Dealer now has: #{display_cards(dealer)}"
    sleep(1)
    if get_total(dealer) > 21
      prompt "Dealer got 'bust'."
      winner = 'Player'
      bust = true
      break
    end
    break if get_total(dealer) > 17
  end

  if bust == false
    prompt "Dealer also decided to stay."
    prompt "It is now time to compare the cards..."
    prompt "Dealer has #{display_cards(dealer)}"
    prompt "Dealer total is: #{get_total(dealer)}"
    prompt "You have #{display_cards(player)}"
    prompt "Your total is: #{get_total(player)}"
    winner = compare_cards(player, dealer)
  end
  sleep(1)
  case winner
  when 'Player'
    score[:Player] += 1
  when 'Dealer'
    score[:Dealer] += 1
  end
  prompt "The winner is #{winner}." if winner != 'tie'
  prompt "Play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

if score.values[0] == score.values[1]
  prompt "It ended in a tie."
else
  prompt "#{score.key(score.values.max)} won!"
end
prompt "Thank you for playing twenty-one! Goodbye!"
