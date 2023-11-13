=begin
  
  Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

  New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

PEDAC

Problem:

  input: Integer corresponding to year
  output: String corresponding to century of input year
  rules: 
    Explicit: 
    - input is Integer
    - output is String
    Implicit:
    - all years are A.D.

Example and test cases:

  century(2000) == '20th'
  century(2001) == '21st'
  century(1965) == '20th'
  century(256) == '3rd'
  century(5) == '1st'
  century(10103) == '102nd'
  century(1052) == '11th'
  century(1127) == '12th'
  century(11201) == '113th'

Data structure:

  Control flow; conditionals. Type conversion. String concatenation.  

Algorithm:

  Define method called century that has 1 parameter called year
  Initialize variable cent_digts to Integer division of year by 100 plus 1
  Subtract 1 from cent_digits if year is multiple of 100
  Convert cent_digts to String
  Case cent_digits converted to String ends in '1': 
    Concatenate 'st' to it 
  Case cent_digits converted to String ends in '2': 
    Concatenate 'nd' to it
  Case cent_digits converted to String ends in 
    Concatenate 'rd' to it 
  Else:
    Concatenate 'th' to it 
  Change last 2 characters of cent_digts to 'th' if second to last numerical digit is '1'
  Return cent_digits

=end

def century(year)
  cent_digts = year/100 + 1
  cent_digts -= 1 if year % 100 == 0
  cent_digts = cent_digts.to_s
  case cent_digts[-1]
  when '1'
    cent_digts << 'st'
  when '2'
    cent_digts << 'nd'
  when '3'
    cent_digts << 'rd'
  else 
    cent_digts << 'th'
  end
  cent_digts[-2, 2]= 'th' if cent_digts[-4] == '1'
  cent_digts
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'

