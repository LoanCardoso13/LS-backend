# rubocop:disable all
=begin

Add the appropriate accessor methods to the following code.

class Person
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name

=end

class Person
	attr_accessor :name
end

person1 = Person.new
person1.name = 'Jessica'
puts person1.name
