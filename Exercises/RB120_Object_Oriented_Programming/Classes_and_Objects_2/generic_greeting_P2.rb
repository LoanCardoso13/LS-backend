# rubocop:disable all
=begin

Using the following code, add two methods: ::generic_greeting and #personal_greeting. The first method should be a class method and print a greeting that's generic to the class. The second method should be an instance method and print a greeting that's custom to the object.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting

=end

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hi, I'm just a cat."
  end

  def personal_greeting
    puts "Hey! I'm the #{name} cat!"
  end

end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting
