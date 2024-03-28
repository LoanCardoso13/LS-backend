# rubocop:disable all
=begin

Create a module named Transportation that contains three classes: Vehicle, Truck, and Car. Truck and Car should both inherit from Vehicle.

=end

## Namespacing ##
module Transportation

  class Vehicle
  end
  class Truck < Vehicle
  end
  class Car < Vehicle
  end

end

chevy = Transportation::Truck.new
p chevy #<Transportation::Truck:0x00007f9b081f8420>
