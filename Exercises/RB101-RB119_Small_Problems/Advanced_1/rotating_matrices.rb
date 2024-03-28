# rubocop:disable all
=begin

  As we saw in the previous exercises, a matrix can be represented in ruby by an Array of Arrays. For example:

                                              1  5  8
                                              4  7  2
                                              3  9  6

  can be described by the Array of Arrays:

                                                matrix = [
                                                [1, 5, 8],
                                                [4, 7, 2],
                                                [3, 9, 6]
                                              ]

  A 90-degree rotation of a matrix produces a new matrix in which each side of the matrix is rotated clockwise by 90 degrees. For example, the 90-degree rotation of the matrix shown above is:

                                              3  4  1
                                              9  7  5
                                              6  2  8

  A 90 degree rotation of a non-square matrix is similar. For example, the rotation of:

                                              3  4  1
                                              9  7  5

  is:
  
                                              9  3
                                              7  4
                                              5  1

  Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.

PEDAC

Problem:

  Produce a 90 degree clockwise rotation on an input array representing a matrix. Each row rotates 90deg clockwise and each column does the same. 

  input: Array of Arrays representing a matrix.
  output: Array of Arrays representing input rotated 90deg clockwise
  rules:
    explicit:
    implicit:

Examples and test cases:

  matrix1 = [
    [1, 5, 8],
    [4, 7, 2],
    [3, 9, 6]
  ]

  matrix2 = [
    [3, 7, 4, 2],
    [5, 1, 0, 8]
  ]

  new_matrix1 = rotate90(matrix1)
  new_matrix2 = rotate90(matrix2)
  new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

  p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
  p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
  p new_matrix3 == matrix2

Data structure:

Algorithm:

  Define the row and column variables, mxn, from input array length and first element's length respectively
  Create a new_matrix of zeros with nxm dimensions
  Iterate over 0 to m-1 (i)
    Iterate over 0 to n-1 (j)
      Assign new_matrix j, -i-1 to matrix i, j

=end

def rotate90(matrix)
  m = matrix.length
  n = matrix[0].length
  new_matrix = []
  n.times do |i|
    row = []
    m.times do |j|
      row << 0 
    end
    new_matrix << row
  end

  m.times do |i|
    n.times do |j|
      new_matrix[j][-i-1] = matrix[i][j]
    end
  end
  new_matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
