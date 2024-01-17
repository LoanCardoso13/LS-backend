module Registrable
  def number_of_pets
    @pets.size
  end
end

class Shelter
  attr_accessor :pets
  attr_reader :name, :register

  include Registrable

  def initialize
    @pets = []
    @register = {}
    @name = 'The Animal Shelter'
  end

  def adopt(owner = self, pet)
    owner.pets << pet
    if register.keys.include?(owner)
      register[owner] << pet
    else
      register[owner] = [pet]
    end
  end

  def print_adoptions
    register.each do |owner, pets|
      if owner.name == 'The Animal Shelter'
        puts 'The Animal Shelter has the following unadopted pets:'
        pets.each do |pet|
          puts "a #{pet.type} named #{pet.name}"
        end
      else
        puts "#{owner.name} has adopted the following pets:"
        pets.each do |pet|
          puts "a #{pet.type} named #{pet.name}"
        end
      end
      puts
    end
  end
end

class Owner
  attr_accessor :pets
  attr_reader :name

  include Registrable

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  attr_reader :name, :type

  def initialize(type, name)
    @type = type
    @name = name
  end
end

asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')
butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(asta)
shelter.adopt(laddie)
shelter.adopt(fluffy)
shelter.adopt(kat)
shelter.adopt(ben)
shelter.adopt(chatterbox)
shelter.adopt(bluebell)
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{shelter.name} has #{shelter.number_of_pets} unadopted pets."
