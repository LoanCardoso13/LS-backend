# rubocop:disable all
=begin

Using the following code, add the appropriate accessor methods so that @name is capitalized upon assignment.

class Person
end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name

=end

class Person
	attr_reader :name

	def name=(n)
		@name= n.capitalize
	end

end

person1 = Person.new
person1.name = 'eLiZaBeTh'
puts person1.name
