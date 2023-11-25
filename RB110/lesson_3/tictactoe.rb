INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brb)
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
  (1..9).each do |num|
    new_board[num]= INITIAL_MARKER
  end 
  new_board
end 

def empty_squares(brb)
  brb.keys.reject { |num| brb[num] != ' ' }
end

def player_places_piece(brb)
  empty_squares = empty_squares(brb)
  loop do 
    prompt "please choose a square among #{empty_squares}"
    square = gets.chomp.to_i
    brb[square]= PLAYER_MARKER
    break if empty_squares.include?(square)
    prompt "Invalid choice, try again."
  end
  display_board(brb)
end
 
board = initialize_board

display_board(board)
player_places_piece(board)

