# rubocop:disable all
=begin

  The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

  The first row contains one 'A'.
  The last row contains one 'A'.
  All rows, except the first and last, have exactly two identical letters.
  The diamond is horizontally symmetric.
  The diamond is vertically symmetric.
  The diamond has a square shape (width equals height).
  The letters form a diamond shape.
  The top half has the letters in ascending order.
  The bottom half has the letters in descending order.
  The four corners (containing the spaces) are triangles.
  Examples

  Diamond for letter 'A':

  A

  Diamond for letter 'C':

    A
   B B
  C   C
   B B
    A

  Diamond for letter 'E':

      A
     B B
    C   C
   D     D
  E       E
   D     D
    C   C
     B B
      A

=end

class Diamond

  def self.make_diamond(limit_letter)
    # Define side as (limit_letter.ord - 'A'.ord)*2 + 1
    # Initialize answer local variable to empty array
    # Initialize current_ascii to 'A'.ord
    # Iterate over the following block with index starting from -1, steping 2 until reaches (side - 2)
    #   let iteration index be defined as idx
    #   content = If idx < 0
    #     'A'
    #   Else
    #     current_ascii += 1
    #     current_ascii.chr + ' '*idx + current_ascii.chr
    #   Put your content at the center of a line made of side number of spaces and shove it into answer array
    #
    # Iterate over the following block with index starting from (side - 4), steping 2 until reaches -1
    #   let iteration index be defined as idx
    #   content = If idx < 0
    #     'A'
    #   Else
    #     current_ascii -= 1
    #     current_ascii.chr + ' '*idx + current_ascii.chr
    #   Put your content at the center of a line made of side number of spaces and shove it into answer array
    #
    # Return answer array joined by new line

    if limit_letter == 'A'
      "A\n"
    else
      current_ascii = 'A'.ord
      side = (limit_letter.ord - current_ascii)*2 + 1
      answer = []

      -1.step(by:2, to: (side - 2)) do |idx|
        content = if idx < 0
                    'A'
                  else
                    current_ascii += 1
                    current_ascii.chr + ' '*idx + current_ascii.chr
                  end
        answer << content.center(side, ' ')
      end

      (side - 4).step(by: -2, to: -1) do |idx|
        content = if idx < 0
                    'A'
                  else
                    current_ascii -= 1
                    current_ascii.chr + ' '*idx + current_ascii.chr
                  end
        answer << content.center(side, ' ')
      end

      answer.join("\n") + "\n"
    end

  end

end
