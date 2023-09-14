require 'yaml'
MESSAGES = YAML.load_file('./loan_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid?(num)
  num.to_i != 0 || # Check if string is made of number, not text
    num == '0' || # Include edge case (1) when user enters zero
    num == '0.0' # Include edge case (2) when user enters zero.zero
end

name = ''
prompt MESSAGES['welcome']
loop do
  name = gets.chomp

  if name.empty?
    prompt MESSAGES['valid_name']
  else
    break
  end
end
prompt "G'day #{name}! " + MESSAGES['greeting']

loop do
  amount = ''
  loop do
    prompt MESSAGES['loan_amount']
    amount = gets.chomp

    if valid?(amount)
      break
    else
      prompt MESSAGES['valid_number']
    end
  end

  annual_rate = ''
  loop do
    prompt MESSAGES['APR']
    annual_rate = gets.chomp

    if valid?(annual_rate) && annual_rate.to_f >= 0
      break
    else
      prompt MESSAGES['valid_number']
    end
  end

  yearly_duration = ''
  loop do
    prompt MESSAGES['duration']
    yearly_duration = gets.chomp

    if valid?(yearly_duration) && yearly_duration.to_f >= 0
      break
    else
      prompt MESSAGES['valid_number']
    end
  end

  # Converting parameters from yearly to monthly, for use in the equation.
  monthly_rate = (annual_rate.to_f / 12) / 100
  monthly_duration = yearly_duration.to_i * 12
  # Core calculator equation.
  monthly_payment = amount.to_f * (monthly_rate / (1 - ((1 + monthly_rate)**(-monthly_duration))))

  prompt "You'll be paying $#{monthly_payment.round(2)} for #{monthly_duration} months. Your monthly interest rate is #{(monthly_rate * 100).round(2)}%."

  prompt MESSAGES['repeat']
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt MESSAGES['thanks']
