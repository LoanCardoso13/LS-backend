# rubocop:disable all
=begin

  In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as represented by a ruby Array of Arrays.

  Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices. Any matrix can be transposed by simply switching columns with rows.

  Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.

PEDAC

Problem:
  Modify transpose method from taking 3x3 matrix into taking any shape of matrix

  input: Array with nested Arrays of any size, all elements are Integers
  output: traspose of the input
  rules:
    explicit:
    implicit:

Examples and test cases:

  transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
  transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
  transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
    [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
  transpose([[1]]) == [[1]]

Data structure:

Algorithm:

  Initialize variable M to input length
  Initialize variable N to input's first element length
  Initialize variable new_matrix to empty Array
  Iterate N times 
    Initialize variable row to empty Array
    Iterate M times 
      push 0 to row
    Push row to new_matrix
  (test code)
  Iterate over 0 to M-1 (i)
    Iterate over 0 to N-1 (j)
      Assign input matrix at i,j to new_matrix at j,i 
  Return new_matrix

=end

def transpose(matrix)
  m = matrix.length
  n = matrix[0].length
  new_matrix = []
  n.times do
    row = []
    m.times do
      row << 0
    end
    new_matrix << row
  end

  m.times do |i|
    n.times do |j|
      new_matrix[j][i] = matrix[i][j]
    end
  end
  new_matrix
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) == [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
