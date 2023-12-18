# rubocop:disable all
=begin

  Let's build another program using madlibs. We made a program like this in the easy exercises. This time, the requirements are a bit different.

  Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source. Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.

PEDAC

Problem:

  Build a program that will take text from an appropriately created file, and print that text while substituting certain places in the text for randomized pre-existing words that are stored in the program's data. These words are stored and classified as either adjectives, nouns, verbs or adverbs. The appropriately created text file accounts for the same classification while providing room for the words.

  input: text file and replacement words
  output: printed out text file with replacement words randomly placed, while keeping consistent categories
  rules:
    explicit:
    implicit:

Examples and test cases:

  Example output:

  The sleepy brown cat noisily
  licks the sleepy yellow
  dog, who lazily licks his
  tail and looks around.

  Example text data:

  The %{adjective} brown %{noun} %{adverb}
  %{verb} the %{adjective} yellow
  %{noun}, who %{adverb} %{verb} his
  %{noun} and looks around.

  Example replacement words:

  adjectives: quick lazy sleepy ugly
  nouns: fox dog head leg
  verbs: jumps lifts bites licks
  adverb: easily lazily noisily excitedly

Data structure:

  External text file with interpolated parts obeying word type classification used - Hash with word database obeying word type classification

Algorithm:

  Inject text from external file into variable text
  Map words from text, use iterative variable str
  Initialize variable word to hash with sampled values
    Format str with word
  Join mappint with spaces and assign it to parsed_text variable
  Print parsed_text

=end

text = File.read('./Exercise_Material/text_data.txt')

parsed_text = text.split.map do |str|
  word = {
    adjective: %w(quick lazy sleepy ugly).sample,
    noun: %w(fox dog head leg).sample,
    verb: %w(jumps lifts bites licks).sample,
    adverb: %w(easily lazily noisily excitedly).sample
  }
  format(str, word)
end.join(' ')

puts parsed_text
