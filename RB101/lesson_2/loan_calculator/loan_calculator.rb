require 'yaml'
# require 'pry'
MESSAGES = YAML.load_file('./loan_messages.yml')

def prompt(message, alt_lang: false)
  puts("#{' ' * 80} [en/pt]") if alt_lang == true
  puts "=> #{message}"
end

def loan_bar(principal, total)
  bar_size = 80
  number_of_hashes = ((bar_size / total) * principal).to_i
  ('#' * number_of_hashes) + ('-' * (bar_size - number_of_hashes))
end

def positive_integer?(str)
  str.to_i.to_s == str && str.to_i > 0
end

def positive_float?(str)
  str.prepend('0') if str.start_with?('.')
  str.to_f.to_s == str && str.to_f >= 0
end

def valid_number?(num)
  (positive_integer?(num) || positive_float?(num))
end

prompt MESSAGES['welcome']
lang = ''
loop do
  lang = gets.chomp.downcase
  break if MESSAGES.include?(lang)

  prompt MESSAGES['valid_lang']
end

name = ''
loop do
  prompt MESSAGES[lang]['name'], alt_lang: true
  name = gets.chomp

  if MESSAGES.include?(name.downcase)
    lang = name.downcase
    next
  elsif name.empty?
    prompt MESSAGES[lang]['valid_name']
  else
    break
  end
end
name.capitalize!
prompt format(MESSAGES[lang]['greeting'], name)

loop do
  amount = ''
  loop do
    prompt MESSAGES[lang]['mortgage_amount'], alt_lang: true
    amount = gets.chomp

    if MESSAGES.include?(amount.downcase)
      lang = amount.downcase
      next
    elsif positive_integer?(amount)
      break
    else
      prompt MESSAGES[lang]['valid_integer']
    end
  end

  annual_rate = ''
  loop do
    prompt MESSAGES[lang]['APR'], alt_lang: true
    annual_rate = gets.chomp

    if MESSAGES.include?(annual_rate.downcase)
      lang = annual_rate.downcase
      next
    elsif valid_number?(annual_rate)
      break
    else
      prompt MESSAGES[lang]['valid_rate']
    end
  end

  yearly_duration = ''
  loop do
    prompt MESSAGES[lang]['duration_years'], alt_lang: true
    yearly_duration = gets.chomp

    if MESSAGES.include?(yearly_duration.downcase)
      lang = yearly_duration.downcase
      next
    elsif positive_integer?(yearly_duration)
      break
    else
      prompt MESSAGES[lang]['valid_integer']
    end
  end

  monthly_duration = ''
  loop do
    prompt MESSAGES[lang]['duration_months'], alt_lang: true
    monthly_duration = gets.chomp

    if MESSAGES.include?(monthly_duration.downcase)
      lang = monthly_duration.downcase
      next
    elsif monthly_duration == '' || monthly_duration == '0'
      monthly_duration = 0
      break
    elsif positive_integer?(monthly_duration)
      break
    else
      prompt MESSAGES[lang]['valid_integer']
    end
  end

  # Converting parameters from yearly to monthly, for use in the equation.
  monthly_rate = (annual_rate.to_f / 12) / 100
  months = (yearly_duration.to_i * 12) + monthly_duration.to_i
  # Core calculator equation.
  monthly_payment =
    amount.to_f * (monthly_rate / (1 - ((1 + monthly_rate)**(-months))))
  # Total payment calculation for illustration purposes
  total_paid = monthly_payment * months

  puts(MESSAGES[lang]['you_pay'] +
  "$#{monthly_payment.round(2)} " +
  MESSAGES[lang]['for'] + "#{months} " +
  MESSAGES[lang]['months'] +
  " #{(monthly_rate * 100).round(2)}%")
  puts loan_bar(amount.to_f, total_paid)
  puts MESSAGES[lang]['legend']

  puts
  prompt MESSAGES[lang]['repeat']
  answer = gets.chomp
  break unless answer.downcase.start_with? 'y'
end

prompt format(MESSAGES[lang]['thanks'], name)
