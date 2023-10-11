require 'yaml'
# require 'pry'
KEYS = YAML.load_file('calculator_messages.yml')
OPERATORS = %w(1 2 3 4)
LANGUAGES = ['en', 'pt']

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

prompt KEYS['welcome']
lang = ''
loop do
  lang = gets.chomp.downcase
  break if LANGUAGES.include?(lang)

  prompt KEYS['valid_lang']
end

name = ''
loop do
  prompt KEYS[lang]['name']
  name = gets.chomp
  break unless name.strip.empty?

  prompt KEYS[lang]['valid_name']
end

prompt "Hey #{name}! " + KEYS[lang]['greeting']
loop do
  number1 = ''
  loop do
    prompt KEYS[lang]['first_number']
    number1 = gets.chomp
    break if valid_number?(number1)

    prompt KEYS[lang]['valid_number']
  end

  number2 = ''
  loop do
    prompt KEYS[lang]['second_number']
    number2 = gets.chomp
    break if valid_number?(number2)

    prompt KEYS[lang]['valid_number']
  end

  operator = ''
  loop do
    prompt KEYS[lang]['operator_prompt']
    operator = gets.chomp
    break if OPERATORS.include?(operator)

    prompt KEYS[lang]['valid_operator']
  end

  prompt operation_to_message(operator, number1, number2)
  sleep 0.8

  result =
    case operator
    when '1'
      number1.to_f + number2.to_f
    when '2'
      number1.to_f - number2.to_f
    when '3'
      number1.to_f * number2.to_f
    when '4'
      number1.to_f / number2.to_f
    end

  prompt KEYS[lang]['result'] + " #{result}"

  prompt KEYS[lang]['repeat']
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt KEYS[lang]['thanks'] + " #{name}!"
