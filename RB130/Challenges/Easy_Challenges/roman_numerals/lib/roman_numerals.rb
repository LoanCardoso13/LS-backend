# rubocop:disable all
=begin

  Write some code that converts modern decimal numbers into their Roman number equivalents.

  The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis. One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.

  The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these letters have lots of straight lines and are hence easy to hack into stone tablets.

   1  => I
  10  => X
   7  => VII

   There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

  Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

  To see this in practice, consider the example of 1990. In Roman numerals, 1990 is MCMXC:

  1000=M
  900=CM
  90=XC

  2008 is written as MMVIII:

  2000=MM
  8=VIII

=end

class RomanNumeral
  attr_reader :arabic

  ROMAN_NUMERALS = [ 'I', 'V', 'X', 'L', 'C', 'D', 'M']

  def initialize(arabic)
    @arabic = arabic
  end

  def to_roman
    # Transform arabic number into its digits organized in an array
    # Initialize empty answer String
    # Initialize local variable pos to 1
    # Iterate through each digit 
    #   Add return value of conversion method, with arguments pos and digit, onto answer String
    #   Increase pos by 2
    # Return answer String
    #
    # Conversion method
    #   Case digit less than 4
    #     multiply digit by Roman at -pos
    #   Case digit 4
    #     Sum Romans from -pos and -(pos - 1)
    #   Case digit 5 through 8
    #     Roman from -(pos - 1) plus (digit - 5) times Roman from -pos
    #   Case digit 9
    #     Sum Roman from -(pos - 1) and -(pos - 2)
    
    arabic_digits = arabic.digits.reverse
    # Just to make sure to always have exactly 4 digits:
    while arabic_digits.size < 4
      arabic_digits.unshift 0
    end

    answer = ''
    pos = 1
    arabic_digits.each do |digit|
      answer += conversion(digit, pos)
      pos += 2
    end
    answer
  end

  def conversion(d, p)
    case d
    when 0..3
      ROMAN_NUMERALS[-p] * d
    when 4
      ROMAN_NUMERALS[-p] + ROMAN_NUMERALS[-(p - 1)]
    when 5..8
      ROMAN_NUMERALS[-(p - 1)] + ROMAN_NUMERALS[-p] * (d - 5)
    when 9
      ROMAN_NUMERALS[-p] + ROMAN_NUMERALS[-(p - 2)]
    end
  end

end
