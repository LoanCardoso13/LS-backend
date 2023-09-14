=begin

  Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

  Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

  PEDAC

  Problem:

    input: get from user a noun, a verb, an adjective and an adverb
    output: print story with user words injected in it

  Examples and test cases:

    Enter a noun: dog
    Enter a verb: walk
    Enter an adjective: blue
    Enter an adverb: quickly

    Do you walk your blue dog quickly? That's hilarious!

  Data structure:

    4 variables, story string with placements for them

  Algorithm:

    * Ask user for a noun, point it to 'noun'
    * Ask user for a verb, point it to 'verb'
    * Ask user for a adjective, point it to 'adjective'
    * Ask user for a adverb, point it to 'adverb'
    * Print story with placements for variables pointing to user input data

=end

print "Enter a noun: "
noun = gets.chomp
print "Enter a verb: "
verb = gets.chomp
print "Enter a adjective: "
adjective = gets.chomp
print "Enter a adverb: "
adverb = gets.chomp

puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"