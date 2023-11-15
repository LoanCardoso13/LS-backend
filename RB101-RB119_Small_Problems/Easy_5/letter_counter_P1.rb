=begin

	Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

	Words consist of any string of characters that do not include a space.

PEDAC

Problem: 

        input: String
        output: Hash with keys being sizes of input words and values being the respective frequencies
        rules: 
          explicit: 
            - input will have at least 1 word
            - words are defined by sequences of characters with no space in between
            - write a method
          implicit: 
            - input may be empty (despite explicit rule) 

Examples and test cases:

	word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
	word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
	word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
	word_sizes('') == {}

Data structure:

        Type conversion. String method. 

Algorithm:

        Define method called word_sizes with parameter 'str'
        Initialize variable 'arr' to 'str' value split 
        Initialize variable 'arr2' to empty array
        Iterate through 'arr' value
          Calculate element length
          Check how many elements in 'arr' have that length
          Push both the length and the number of elements in 'arr' with that length onto 'arr2' as a 2-element sub array
        Get rid of repeating elements in 'arr2'
        Transform 'arr2' into a hash and return it 

=end


