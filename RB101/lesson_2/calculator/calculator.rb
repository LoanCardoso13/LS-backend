OPERATORS = %w(1 2 3 4)

def operation_to_message(choice, num1, num2)
  case choice
  when '1'
    "Adding #{num1} to #{num2}..."
  when '2'
    "Subtracting #{num2} from #{num1}..."
  when '3'
    "Multiplying #{num1} and #{num2}..."
  when '4'
    "Dividing #{num1} by #{num2}..."
  end
end

def prompt(phrase)
  puts "=> #{phrase}"
end

def valid_number?(num)
  num == '0' || num == '0.0' || num.to_f != 0
end

prompt 'Welcome to the calculator!'

name = ''
loop do
  prompt 'Please enter your name: '
  name = gets.chomp
  break unless name.strip.empty?

  prompt "Sorry, names can't be blank..."
end

prompt "Hey #{name}! I hope you enjoy using the calculator!"
loop do
  number1 = ''
  loop do
    prompt 'Please enter first term of operation: '
    number1 = gets.chomp
    break if valid_number?(number1)

    prompt 'Not a valid number...'
  end

  number2 = ''
  loop do
    prompt 'Please enter second term of operation: '
    number2 = gets.chomp
    break if valid_number?(number2)

    prompt 'Not a valid number...'
  end

  operator = ''
  operator_prompt = <<-OPERATION_MESSAGE
  What operation would you like to perform?
    1) Addition
    2) Subtraction
    3) Multiplication
    4) Division
  OPERATION_MESSAGE
  loop do
    prompt operator_prompt
    operator = gets.chomp
    break if OPERATORS.include?(operator)

    prompt 'Please, choose either 1, 2, 3 or 4.'
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

  prompt "The result is #{result}"

  prompt 'Any more calculations to perform? (Y/n)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for using the calculator #{name}!"
