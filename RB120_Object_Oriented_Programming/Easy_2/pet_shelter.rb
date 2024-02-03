# rubocop:disable all
class Pet
  attr_reader :name, :type

  def initialize(type, name)
    @name = name
    @type = type
  end

end


class Owner
  attr_reader :name
  attr_accessor :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    @pets.length
  end

end

class Shelter
  attr_accessor :register

  def initialize
    @register = []
  end

  def adopt(owner, pet)
    owner.pets << pet
    register << owner if !register.include?(owner)
  end

  def print_adoptions
    unadopted, adopted = register.partition { |owner| owner.name == 'The Animal Pet Shelter' }

    puts "#{unadopted[0].name} has the following unadopted pets:"
    unadopted[0].pets.each do |pet|
      puts "A #{pet.type} named #{pet.name}"
    end
    puts 

    adopted.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.pets.each do |pet|
        puts "A #{pet.type} named #{pet.name}"
      end
      puts
    end
  end

end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')
itself  = Owner.new('The Animal Pet Shelter')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(itself, asta)
shelter.adopt(itself, laddie)
shelter.adopt(itself, fluffy)
shelter.adopt(itself, kat)
shelter.adopt(itself, ben)
shelter.adopt(itself, chatterbox)
shelter.adopt(itself, bluebell)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{itself.name} has #{itself.number_of_pets} unadopted pets."
