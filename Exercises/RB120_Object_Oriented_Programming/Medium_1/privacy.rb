# rubocop:disable all
=begin

Consider the following class:

class Machine
  attr_writer :switch

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

Modify this class so both flip_switch and the setter method switch= are private methods.

=end

class Machine

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def check_switch_position
    puts "The switch is #{switch}."
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end
