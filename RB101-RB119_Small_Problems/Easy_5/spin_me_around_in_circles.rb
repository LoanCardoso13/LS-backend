=begin

	You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?
        
	def spin_me(str)
	  str.split.each do |word|
	    word.reverse!
	  end.join(" ")
	end

	spin_me("hello world") # "olleh dlrow"

        To answer one must take a look at the documentation for methods being used in the method chain within the 'spin_me' method definition. In case any of these return a new object, then no, the returned string is a new object, otherwise yes, it is the same string. 

        The answer is no because the String#split method returns a new (Array) object.

end
