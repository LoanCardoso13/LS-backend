# rubocop:disable all
=begin

  The following code:

  def my_method(array)
    if array.empty?
      []
    elsif
      array.map do |value|
        value * value
      end
    else
      [7 * array.first]
    end
  end

  p my_method([])
  p my_method([3])
  p my_method([3, 4])
  p my_method([5, 6, 7])

  is expected to print:

  []
  [21]
  [9, 16]
  [25, 36, 49]

  However, it does not. Obviously, there is a bug. Find and fix the bug, then explain why the buggy program printed the results it did.

PEDAC

Problem:

  input:
  output:
  rules:
    explicit:
    implicit:

Examples and test cases:

Data structure:

Algorithm:

  Explanation: The elsif branch of the If-expression did not have a condition set, thence the return value of the Array#map method call becomes the condition and, as it will evaluate as truthy, it gets the code within it executed, but at this point there is no code to execute, so it returns nil. 

=end

def my_method(array)
  if array.empty?
    []
  elsif# array.length > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([]) #  []
p my_method([3]) #  [21]
p my_method([3, 4]) #  [9, 16]
p my_method([5, 6, 7]) #  [25, 36, 49]
