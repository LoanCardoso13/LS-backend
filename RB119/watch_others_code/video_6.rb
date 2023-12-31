# rubocop:disable all
=begin

You are going to be given an array of integers. Your job is to take that array and find an index N where the sum of the integers to the left of N is equal to the sum of the integers to the right of N. If there is no index that would make this happen, return -1.

For example:
Let's say you are given the array [ 1, 2, 3, 4, 3, 2, 1]
Your method will return the index 3, because at the 3rd position in the array, the sum of the left side of the index [1, 2, 3] and the sum of the right side of the index [3, 2, 1] both equal 6.

Another one:
You are given the array [20, 10, -80, 10, 10, 15, 35]
At index 0 the left side is []
The right side is [ 10, -80, 10, 10, 15, 35]
They both are equal to 0 when added. (empty arrays are equal to zero for this problem)
Index 0 is the place where the left side and the right side are equal

Problem: 
Find the index, if there is one, of the place in the input array where the sum of the elements to the left of it equals the sum of the elements to the right of it. Return this index. If not found, return -1. 

Algorithm: 
Iterate through indexes ranging from 0 until input array length - 1
  return index if sum of left elements equals sum of right elements [0...i] - [i+1..-1]
Return -1

=end

def find_even_index(arr)
  0.upto(arr.length-1) do |i|
    return i if arr[0...i].sum == arr[(i+1)..-1].sum
  end
  return -1
end

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3
