# rubocop:disable all
=begin

  Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.  

PEDAC

Problem:

  Write a method that takes an odd Integer n and displays/print a diamond in an nxn grid. The diamond is as follows:
    - Has 4 points, 1 for each coordinate N, S, E, W
      - A point is defined by displaying only 1 asteristik
    - Symetric, both vertically and horizontally
    - Horizontally, first half printed by
      - First line containing 1 * in the middle of (n-1)/2 spaces,  
      - Second line containing 3 *'s in the middle of (n-3)/2 spaces,
      ... until there is no space left ( n = * )
    - Then second half by 
      - First line containing (n-2) *'s in the middle of 1 space 
      - Second line containing (n-4) *'s in the middle of 2 spaces

  input: odd Integer
  output: 4-pointed diamond printed to the screen, consisting of an n x n grid (where n is input)
  rules:
    explicit:
      - write a method
    implicit:
      - grid is shaped with 2 orthogonal axis, horizontal and vertical, of size n

Examples and test cases:

  diamond(1)

  *

  diamond(3)

   *
  ***
   *

   diamond(9)

      *
     ***
    *****
   *******
  *********
   *******
    *****
     ***
      *

Data structure:

  String-Integer operations - Iteration

Algorithm:

  Print the following
  spaces from n/2 (integer division) subtracting 1 until zero and then adding 1 up to n/2 (integer division) PLUS starts from 1 adding 2 until n and then subtracting 2 until 1

  Define method called diamons with parameter n
  Initialize j to 1
  From n/2 down to 0 do 
    Define iterative variable i
    print i spaces plus j times stars
    Increase j by 2
  Initialize l to n-2
  From 1 to n/2 do 
    Define iterative variable k
    print k spaces plus l times stars
    Decrease l by 2

-------------------------------------------------------

  Define method called diamonds2 with parameter n
  Initialize variable stars to 1
  Initialize spaces variable to n/2
  Iterate n times (indexing from 0 to n-1)
    Define iterative variable i
    If i <= n/2
      print spaces times spaces + stars times stars
      increase stars by 2
      decrease spaces by 1
    Else
      increase spaces by 1
      decrease stars by 2
      print spaces times spaces + stars times stars

-------------------------------------------------------

  Define method called diamonds 3 with parameter n
  Initialize variable grid_line to n spaces
  From 0 to n/2 do
    Define iterative variable i
    mutate grid_line from n / 2 - i to n / 2 + i range into (1 + 2*i) stars
    print grid_line
  From 1 to n/2 do
    Define iterative variable j
    mutate grid_line from 0, j characters,  to j spaces
    mutate grid_line from -j, j characters, to j spaces
    print grid_line

---
  - Horizontally, first half printed by
    - First line containing 1 * in the middle of (n-1)/2 spaces,  
    - Second line containing 3 *'s in the middle of (n-3)/2 spaces,
    ... until there is no space left ( n = * )
  - Then second half by 
    - First line containing (n-2) *'s in the middle of 1 space 
    - Second line containing (n-4) *'s in the middle of 2 spaces
    ... until * = 1 in the middle of (n-1)/2 spaces

  Define method called diamonds 4 with parameter n
  With index ranging from 1 to n, call it idx and 
    next if idx is even
    Print (n-idx)/2 spaces followed by idx *'s
  With index ranging from 1 to (n-1)/2, call it idx and
    Print idx spaces followed by (n-2*idx) *'s


=end

def diamonds(n)
  j = 1
  (n/2).downto(0) do |i|
    puts " "*i + '*'*j
    j += 2
  end
  l = n - 2
  1.upto(n/2) do |k|
    puts ' '*k + '*'*l
    l -= 2
  end
end

def diamonds2(n)
  stars = 1
  spaces = n/2
  n.times do |i|
    if i <= n/2
      puts ' '*spaces + '*'*stars
      stars += 2
      spaces -= 1
    else
      spaces = i == n/2+1 ? spaces + 2 : spaces + 1
      stars = i == n/2+1 ? stars - 4 : stars - 2
      puts ' '*spaces + '*'*stars
    end
  end
end

def diamonds3(n)
  grid_line = ' '*n
  0.upto(n/2) do |i|
    grid_line[n/2-i..n/2+i]= '*'*(1+2*i)
    puts grid_line
  end
  1.upto(n/2) do |j|
    grid_line[0, j]= ' '*j
    grid_line[-j, j]= ' '*j
    puts grid_line
  end
end

def diamonds4(n)
  1.upto(n) do |idx|
    next if idx.even?
    puts ' '*((n-idx)/2) + '*'*idx
  end
  1.upto((n-1)/2) do |idx|
    puts ' '*idx + '*'*(n-(2*idx))
  end
end

diamonds4(1)
puts
diamonds4(3)
puts
diamonds4(9)
