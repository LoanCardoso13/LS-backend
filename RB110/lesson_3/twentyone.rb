RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'jack', 'queen', 'king', 'ace']
score = { Player: 0, Dealer: 0 }

def prompt(msg)
  puts "=> #{msg}"
end

def hit_or_stay
  loop do
    prompt "(H)it or (S)tay?"
    answer = gets.chomp
    return answer.downcase[0] if ['h', 's'].include?(answer.downcase[0])
    prompt "Not a valid answer..."
  end
end

def correct_for_aces(hand, sum)
  hand.each do |card|
    if card.values[0] == 'ace'
      break if sum <= 21
      sum -= 10
    end
  end
  sum
end

def get_total(hand)
  sum = 0
  hand.each do |card|
    sum += if (2..10).include?(card.values[0])
             card.values[0]
           elsif card.values[0] != 'ace'
             10
           else
             11
           end
  end
  correct_for_aces(hand, sum)
end

def detect_result(player, dealer)
  player_total = get_total(player)
  dealer_total = get_total(dealer)

  if player_total > 21
    :player_busted
  elsif dealer_total > 21
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def update_score(res, sc)
  case res
  when :player_busted, :dealer
    sc[:Dealer] += 1
  when :dealer_busted, :player
    sc[:Player] += 1
  end
end

def display_result(player, dealer, score)
  result = detect_result(player, dealer)
  update_score(result, score)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

def play_again?(player, dealer, score)
  display_result(player, dealer, score)
  puts
  prompt "Play again? (y/n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

def display_cards(hand)
  if hand.instance_of?(Hash)
    "#{hand.values[0]} of #{hand.keys[0]}"
  else
    arr = hand.map { |card| "#{card.values[0]} of #{card.keys[0]}" }
    arr[0...(arr.length - 1)].join(', ') + " and #{arr.last}"
  end
end

def give_random_card(deck)
  suit = deck.keys.sample
  rank = deck[suit].sample
  deck[suit].delete(rank)
  { suit => rank }
end

loop do # Game loop (1 game consists of player and dealer turns)
  deck = {
    hearts: RANKS.dup,
    diamonds: RANKS.dup,
    clubs: RANKS.dup,
    spades: RANKS.dup
  } # Reshuffling the card deck
  player = []
  dealer = []
  system 'clear'

  2.times do |_| # Dealing cards
    player << give_random_card(deck)
    dealer << give_random_card(deck)
  end

  prompt "Welcome to the Twenty-One game!"
  prompt "If you go over 21, it's a 'bust' and you lose."
  puts
  prompt "Current score: Player #{score[:Player]} x #{score[:Dealer]} Dealer."
  puts
  prompt "Dealer has a #{display_cards(dealer.sample)} and unknown card."

  loop do # Player turn
    prompt "You have: #{display_cards(player)}. Your total is #{get_total(player)}."
    player_decision = hit_or_stay
    if player_decision == 'h'
      player << give_random_card(deck)
      prompt "You got a #{display_cards(player.last)}."
    end
    break if player_decision == 's' || get_total(player) > 21
  end

  if get_total(player) > 21
    play_again?(player, dealer, score) ? next : break
  end

  while get_total(dealer) < 17
    prompt "Dealer total is less than 17, he decides to hit..."
    sleep(1)
    dealer << give_random_card(deck)
    prompt "Dealer received #{display_cards(dealer.last)}"
    prompt "Dealer now has: #{display_cards(dealer)}"
    sleep(1)
  end

  if get_total(dealer) > 21
    play_again?(player, dealer, score) ? next : break
  end

  prompt "Dealer also decided to stay."
  sleep(1)
  prompt "It is now time to compare the cards..."
  sleep(1)
  prompt "Dealer has #{display_cards(dealer)}"
  prompt "Dealer total is: #{get_total(dealer)}"
  sleep(1)
  prompt "You have #{display_cards(player)}"
  prompt "Your total is: #{get_total(player)}"
  sleep(1)

  sleep(1)
  break unless play_again?(player, dealer, score)
end

if score.values[0] == score.values[1]
  prompt "It ended in a tie."
else
  prompt "#{score.key(score.values.max)} won!"
end
prompt "Thank you for playing twenty-one! Goodbye!"
