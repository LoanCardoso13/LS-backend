# rubocop:disable all
=begin

Using the following code, create a class named Cat that prints a greeting when #greet is invoked. The greeting should include the name and color of the cat. Use a constant to define the color.

kitty = Cat.new('Sophie')
kitty.greet

=end

class Cat
  COLOR = 'green'

  def initialize(n)
    @name= n
  end

  def greet
    puts "I'm #{@name}, a #{COLOR} cat."
  end

end

kitty = Cat.new('Sophie')
kitty.greet
