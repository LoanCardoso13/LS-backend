# rubocop:disable all
=begin

  Write a method that returns the number of Friday the 13ths in the year given by an argument. You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

PEDAC

Problem:

  Write a method that returns the number of Friday 13ths in a given year; i.e. for that year, the number of times that the 13th day of a month coincided with being a Friday weekday.

  input: Integer representing an year
  output: Integer representing the count of Friday 13ths for that year
  rules:
    explicit:
    implicit:

Examples and test cases:

  friday_13th(2015) == 3
  friday_13th(1986) == 1
  friday_13th(2019) == 2

Data structure:

Algorithm:

  Define method called friday_13th with parameter: year
  Initialize variable count to 0
  Iterate 12 times, with index ranging from 1 to 12, call index month
  If Ruby's Time class method invoked with year , month and 13 as arguments, chained with #friday? method  
    increase count by 1
  Return count

=end

def friday_13th(year)
  count = 0
  1.upto(12) do |month|
    count += 1 if Time.utc(year, month, 13).friday?
  end
  count
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2
