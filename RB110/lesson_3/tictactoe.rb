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

loop do # main loop (multiple games)
  board = initialize_board
  display_board(board, score)
  loop do # single game loop
    player_places_piece(board)
    display_board(board, score)
    break if someone_win?(board) || board_full?(board)
    prompt "Running algorithms to calculate optimal move..."
    sleep(1.3)
    computer_places_piece(board)
    display_board(board, score)
    break if someone_win?(board) || board_full?(board)
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
