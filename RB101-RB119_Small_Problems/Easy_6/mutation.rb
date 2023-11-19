=begin 

	What will the following code print, and why? Don't run the code until you have tried to answer.

	array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
        array2 = []
        array1.each { |value| array2 << value }
        array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
        puts array2

        Answer: 
        On line 7 object passing takes place for each element of the Array iteration. That means that the block's parameter is being assigned an existing object each time the block iterates; no new object is created. Furthermore, Array#<< does not create a new object either. Therefore, the objects being mutated on line 8 are the same objects referenced by 'arr2' and when these are output on line 9 they'll be mutated.
=end


array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

