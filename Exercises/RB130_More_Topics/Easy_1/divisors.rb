# rubocop:disable all
=begin

  Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

  divisors(1) == [1]
  divisors(7) == [1, 7]
  divisors(12) == [1, 2, 3, 4, 6, 12]
  divisors(98) == [1, 2, 7, 14, 49, 98]
  divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

=end

def divisors(n)
  result = []
  n.times do |candidate|
    result << (candidate + 1) if n % (candidate + 1) == 0
  end
  result
end

p   divisors(1) == [1]
p   divisors(7) == [1, 7]
p   divisors(12) == [1, 2, 3, 4, 6, 12]
p   divisors(98) == [1, 2, 7, 14, 49, 98]
p   divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute


