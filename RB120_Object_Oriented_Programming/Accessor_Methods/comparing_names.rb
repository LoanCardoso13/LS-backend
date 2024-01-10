# rubocop:disable all
=begin

Using the following code, add the appropriate accessor methods. Keep in mind that the last_name getter shouldn't be visible outside the class, while the first_name getter should be visible outside the class.

class Person
  def first_equals_last?
    first_name == last_name
  end
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?

=end

class Person
	attr_writer :last_name
	attr_accessor :first_name

  def first_equals_last?
    first_name == last_name
  end

	private

	def last_name
		@last_name
	end
end

person1 = Person.new
person1.first_name = 'Dave'
person1.last_name = 'Smith'
puts person1.first_equals_last?
