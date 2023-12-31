require 'yaml'
# require 'pry'
KEYS = YAML.load_file('calculator_messages.yml')

def operation_to_message(choice, num1, num2)
  case choice
  when '1'
    "#{num1} + #{num2}..."
  when '2'
    "#{num1} - #{num2}..."
  when '3'
    "#{num1} * #{num2}..."
  when '4'
    "#{num1} / #{num2}..."
  end
end

def calculation(op, num1, num2)
  case op
  when '1'
    num1.to_f + num2.to_f
  when '2'
    num1.to_f - num2.to_f
  when '3'
    num1.to_f * num2.to_f
  when '4'
    num1.to_f / num2.to_f
  end
end

def prompt(phrase)
  puts "=> #{phrase}"
end

def integer?(str)
  str.to_i.to_s == str
end

def float?(str)
  str.prepend('0') if str.start_with?('.')
  str.to_f.to_s == str
end

def valid_number?(num)
  integer?(num) || float?(num)
end

def get_number(num_choice, lang)
  loop do
    prompt KEYS[lang][num_choice]
    num = gets.chomp
    return num if valid_number?(num)

    prompt KEYS[lang]['valid_number']
  end
end

def get_word(word_choice, lang='en')
  loop do
    user_word = gets.chomp
    case word_choice
    when 'language'
      return user_word if KEYS.include?(user_word)
      prompt KEYS['valid_lang']
    when 'name'
      return user_word unless user_word.strip.empty?
      prompt KEYS[lang]['valid_name']
    when 'operand'
      return user_word if %w(1 2 3 4).include?(user_word)
      prompt KEYS[lang]['valid_operator']
    end
  end
end

prompt KEYS['welcome']
lang = get_word('language')

prompt KEYS[lang]['name']
name = get_word('name', lang)

prompt format(KEYS[lang]['greeting'], name)
loop do
  number1 = get_number('first_number', lang)

  number2 = get_number('second_number', lang)

  prompt KEYS[lang]['operator_prompt']
  operator = get_word('operand', lang)

  prompt operation_to_message(operator, number1, number2)
  sleep 0.8

  result = calculation(operator, number1, number2)

  prompt format(KEYS[lang]['result'], result)

  prompt KEYS[lang]['repeat']
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt format(KEYS[lang]['thanks'], name)
