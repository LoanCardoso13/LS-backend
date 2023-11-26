INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brb)
  system 'clear'
  puts ' '*5 + '|' + ' '*5 + '|' + ' '*5
  puts ' '*2 + brb[1] + ' '*2 + '|' + ' '*2 + brb[2] + ' '*2 + '|' + ' '*2 + brb[3] + ' '*2
  puts ' '*5 + '|' + ' '*5 + '|' + ' '*5
  puts '+'*5 + '+' + '+'*5 + '+' + '+'*5
  puts ' '*5 + '|' + ' '*5 + '|' + ' '*5
  puts ' '*2 + brb[4] + ' '*2 + '|' + ' '*2 + brb[5] + ' '*2 + '|' + ' '*2 + brb[6] + ' '*2
  puts ' '*5 + '|' + ' '*5 + '|' + ' '*5
  puts '+'*5 + '+' + '+'*5 + '+' + '+'*5
  puts ' '*5 + '|' + ' '*5 + '|' + ' '*5
  puts ' '*2 + brb[7] + ' '*2 + '|' + ' '*2 + brb[8] + ' '*2 + '|' + ' '*2 + brb[9] + ' '*2
  puts ' '*5 + '|' + ' '*5 + '|' + ' '*5
end

def initialize_board
  new_board = {}
  (1..9).each { |n| new_board[n]= INITIAL_MARKER } 
  new_board
end 

def empty_squares(brb)
  brb.keys.reject { |num| brb[num] != INITIAL_MARKER }
end

def player_places_piece(brb)
  square = 0
  loop do 
    prompt "please choose a square (#{empty_squares(brb).join(',')}):"
    square = gets.chomp.to_i
    break if empty_squares(brb).include?(square)
    prompt "Invalid choice, try again."
  end
  brb[square]= PLAYER_MARKER
end

def computer_places_piece(brb)
  square = empty_squares(brb).sample
  brb[square]= COMPUTER_MARKER
end

def detect_winner(brb)
  winning_sequences = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                      [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                      [[1, 5, 9], [3, 5, 7] ] # diagonals
  winning_sequences.each do |seq|
    if brb[seq[0]] == PLAYER_MARKER &&
       brb[seq[1]] == PLAYER_MARKER &&
       brb[seq[2]] == PLAYER_MARKER 
      return 'Player'
    elsif brb[seq[0]] == COMPUTER_MARKER &&
	  brb[seq[1]] == COMPUTER_MARKER &&
	  brb[seq[2]] == COMPUTER_MARKER 
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

loop do # main loop (multiple games) 
  board = initialize_board
  display_board(board)
  loop do # single game loop
    player_places_piece(board)
    display_board(board)
    break if someone_win?(board) || board_full?(board)
    prompt "Running algorithms to calculate optimal move..."
    sleep(1.5)
    computer_places_piece(board)
    display_board(board)
    break if someone_win?(board) || board_full?(board)
  end
  if someone_win?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie..."
  end
  prompt "Would you like to play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"

