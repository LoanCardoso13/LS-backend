require 'yaml'
MESSAGES = YAML.load_file('./rps_messages.yml')

VALID_CHOICES = { r: 'rock', p: 'paper', sc: 'scissors', l: 'lizard', sp: 'spock' }
who_wins = [
  ['scissors', 'paper'],
  ['paper', 'rock'],
  ['rock', 'lizard'],
  ['lizard', 'spock'],
  ['spock', 'scissors'],
  ['scissors', 'lizard'],
  ['lizard', 'paper'],
  ['paper', 'spock'],
  ['spock', 'rock'],
  ['rock', 'scissors']
]

def prompt(message)
  puts "=> #{message}"
end

def display_results(u_choice, c_choice, table, score)
  table.each do |pair|
    if pair[0] == u_choice && pair[1] == c_choice
      prompt MESSAGES['you_win']
      score[0] += 1
      break
    elsif pair[0] == c_choice && pair[1] == u_choice
      prompt MESSAGES['you_lose']
      score[1] += 1
      break
    elsif u_choice == c_choice
      prompt MESSAGES['tie']
      break
    end
  end
end

prompt MESSAGES['welcome']

name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt MESSAGES['valid_name']
  else
    break
  end
end

prompt "Hey #{name}! " + MESSAGES['greeting']
game_prompt = <<-MSG
In this game, the following rules apply:

          Scissors cuts paper,
          Paper covers rock,
          Rock crushes lizard,
          Lizard poisons Spock,
          Spock smashes scissors,
          Scissors decapitates lizard,
          Lizard eats paper,
          Paper disproves Spock,
          Spock vaporizes rock,
          and Rock crushes scissors

MSG
prompt game_prompt
prompt MESSAGES['score_rules']

loop do
  score = [0, 0]
  while score[0] < 3 && score[1] < 3
    user_entry = ''
    loop do
      prompt MESSAGES['choice']
      VALID_CHOICES.each do |k, v|
        puts "Type (#{k.upcase}) for #{v}"
      end
      user_entry = gets.chomp.downcase
      if VALID_CHOICES.include?(user_entry.to_sym)
        break
      else
        prompt MESSAGES['valid_choice']
      end
    end

    puts
    user_choice = VALID_CHOICES[user_entry.to_sym]
    computer_choice = VALID_CHOICES.to_a.transpose[1].sample()
    prompt MESSAGES['computer_choice'] + computer_choice
    display_results(user_choice, computer_choice, who_wins, score)
    prompt "Current score is #{score[0]} for #{name} and #{score[1]} for the computer."

  end

  puts
  prompt MESSAGES['repeat']
  repeat_answer = gets.chomp
  break unless repeat_answer.downcase.start_with?('y')
end

prompt MESSAGES['thanks']
