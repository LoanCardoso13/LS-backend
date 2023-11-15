=begin

	Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

PEDAC

Problem: 

Examples and test cases:

	word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
	word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
	word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
	word_sizes('') == {}

Data structure:

Algorithm:

        Define method called word_sizes with parameter 'str'
        Initialize variable 'arr' to 'str' value split 
        Initialize variable 'arr2' to empty array
        Iterate through 'arr' value
          Filter out non-alphabetical characters from element
          Calculate element length
          Check how many elements in 'arr' have that length
          Push both the length and the number of elements in 'arr' with that length onto 'arr2' as a 2-element sub array
        Get rid of repeating elements in 'arr2'
        Transform 'arr2' into a hash and return it
=end
