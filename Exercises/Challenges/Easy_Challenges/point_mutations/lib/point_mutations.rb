=begin

  Write a program that can calculate the Hamming distance between two DNA strands.

  A mutation is simply a mistake that occurs during the creation or copying of a nucleic acid, in particular DNA. Because nucleic acids are vital to cellular functions, mutations tend to cause a ripple effect throughout the cell. Although mutations are technically mistakes, a very rare mutation may equip the cell with a beneficial attribute. In fact, the macro effects of evolution are attributable to the accumulated result of beneficial microscopic mutations over many generations.

  The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.

  By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.

  This is called the Hamming distance.

  GAGCCTACTAACGGGAT
  CATCGTAATGACGGCCT
  ^ ^ ^  ^ ^    ^^

  The Hamming distance between these two DNA strands is 7.

  The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.

=end

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    min_len = [strand.length, other_strand.length].min
    sample1 = strand[0, min_len]
    sample2 = other_strand[0, min_len]
    count = 0
    sample1.size.times { |idx| count += 1 if strand[idx] != sample2[idx] }
    count
  end
end
