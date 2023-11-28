INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_SEQUENCES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                    [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                    [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brb, score)
  system 'clear'
  puts "Current score is: Player #{score[0]} vs Computer #{score[1]}"
  puts "(Match ends when a score of 5 is achieved.)"
  puts
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts
  puts "     |     |"
  puts "  #{brb[1]}  |  #{brb[2]}  |  #{brb[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brb[4]}  |  #{brb[5]}  |  #{brb[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brb[7]}  |  #{brb[8]}  |  #{brb[9]}"
  puts "     |     |"
  puts
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |n| new_board[n] = INITIAL_MARKER }
  new_board
end

def empty_squares(brb)
  brb.keys.reject { |num| brb[num] != INITIAL_MARKER }
end

def joinor(arr, joiner=', ', last_joiner='or')
  arr[0, arr.length - 1].join(joiner) + " #{last_joiner} #{arr[-1]}"
end

def player_places_piece(brb)
  square = 0
  loop do
    if empty_squares(brb).length == 1
      prompt "please choose #{empty_squares(brb)[0]}"
    else
      prompt "please choose a square #{joinor(empty_squares(brb))}:"
    end
    square = gets.chomp.to_i
    break if empty_squares(brb).include?(square)
    prompt "Invalid choice, try again."
  end
  brb[square] = PLAYER_MARKER
end

def computer_places_piece(brb)
  prompt "Running algorithms to calculate optimal move..."
  sleep(1.3)
  threats = []
  opportunities = []
  WINNING_SEQUENCES.each do |seq|
    if brb.values_at(*seq).count(PLAYER_MARKER) == 2
      threats.push (seq & empty_squares(brb))[0] 
    elsif brb.values_at(*seq).count(COMPUTER_MARKER) == 2
      opportunities.push (seq & empty_squares(brb))[0]
    end
  end
  threats.compact!
  opportunities.compact!
  if empty_squares(brb).include?(5)
    square = 5
  else
    if opportunities.empty?
      if threats.empty?
        square = empty_squares(brb).sample
      else
        square = threats[0]
      end
    else 
      square = opportunities[0]
    end
  end
  brb[square] = COMPUTER_MARKER
end

def place_piece(who_plays, brb)
  case who_plays
  when 'Player'
    player_places_piece(brb)
  when 'Computer'
    computer_places_piece(brb)
  end
end

def detect_winner(brb)
  WINNING_SEQUENCES.each do |seq|
    if brb.values_at(*seq).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brb.values_at(*seq).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  false
end

def someone_win?(brb)
  !!detect_winner(brb)
end

def board_full?(brb)
  empty_squares(brb).empty?
end

# ===Program Begins===

score = [0, 0]
winner = ''
players = [ 'Player', 'Computer']
turn = 0

loop do # order of player turn loop
  system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  prompt "Who should start?"
  prompt "(P)layer or (C)omputer?"
  answer = gets.chomp
  if answer.downcase.start_with?('c')
    players.reverse!
    break
  else answer.downcase.start_with?('p')
    break
  end
  prompt "Not a valid choice... Please choose either (P)layer or (C)omputer."
end

loop do # main loop (multiple games)
  board = initialize_board
  display_board(board, score)
  loop do # single game loop
    current_player = players[turn % 2]
    place_piece(current_player, board)
    display_board(board, score)
    break if someone_win?(board) || board_full?(board)
    turn += 1
  end
  if someone_win?(board)
    winner = detect_winner(board)
    prompt "#{winner} won!"
    case winner
    when 'Player'
      score[0] += 1
    when 'Computer'
      score[1] += 1
    end
  else
    prompt "It's a tie..."
  end
  break prompt "The winner is #{winner}" if score[0] == 5 || score[1] == 5
  prompt "Would you like to play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "The winner is #{winner}!" unless winner.empty?
prompt "Thanks for playing Tic Tac Toe! Goodbye!"

# ===Program Ends===
