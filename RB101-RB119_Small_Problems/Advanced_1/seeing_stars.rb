# rubocop:disable all
=begin

  Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

PEDAC

Problem:

  Write a method that will display an 8-pointed start shaped by asteristiks in an nxn grid, where n is the supplied input odd Integer. A star is: 
  3 sections:
    Section 1)
    asteristiks on first, last and middle row places
    then 2 former ones keep moving, forward and backward 1 place, respetively, oneach line, middle is kept
    ... until they all meet at the center, i.e. first is now at n/2 (integer division, index starting at 1) position and last is 2 places forward
    Section 2) 
    row of n asteristiks
    Section 3) 
    first and last now move from middle back to their initial position

  input:
  output:
  rules:
    explicit:
    implicit:

Examples and test cases:

star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *

Data structure:

    Section 1)
    asteristiks on first, last and middle row places
    then 2 former ones keep moving, forward and backward 1 place, respetively, oneach line, middle is kept
    ... until they all meet at the center, i.e. first is now at n/2 (integer division, index starting at 1) position and last is 2 places forward
    Section 2) 
    row of n asteristiks
    Section 3) 
    first and last now move from middle back to their initial position

Algorithm:

  Define method called star with parameter n
  Initialize iteration_limit variable to (n-1)/2
  With index ranging from 1 to iteration limit, call it idx and do
    Initialize space_row variable to (n-3) spaces
    Print space_row with asteristiks inserted at (idx-1) and -idx then (method chain) in the middle
  Print n asteristiks
  With index ranging from iteration_limit to 1, call it idx and do
    Initialize space_row variable to (n-3) spaces
    Print space_row with asteristiks inserted at (idx-1) and -idx then (method chain) in the middle

=end

def star(n)
  iteration_limit = (n-1)/2
  1.upto(iteration_limit) do |idx|
    space_row = ' '*(n-3)
    puts space_row.insert(idx-1, '*').insert(-idx,'*').insert((n-1)/2,'*')
  end
  puts '*'*n
  (iteration_limit).downto(1) do |idx|
    space_row = ' '*(n-3)
    puts space_row.insert(idx-1, '*').insert(-idx,'*').insert((n-1)/2,'*')
  end
end

star(7)

star(9)
