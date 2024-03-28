# rubocop:disable all
=begin

  Write a program that manages robot factory settings.

  When robots come off the factory floor, they have no name. The first time you boot them up, a random name is generated, such as RX837 or BC811.

  Every once in a while, we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask, it will respond with a new random name.

  The names must be random; they should not follow a predictable sequence. Random names means there is a risk of collisions. Your solution should not allow the use of the same name twice.

=end

class Robot
  attr_reader :name

  @@names_created = []

  def initialize
    reset
  end

  def reset
    candidate_name = ''
    2.times { |_| candidate_name << ('A'..'Z').to_a.sample }
    3.times { |_| candidate_name << ('0'..'9').to_a.sample }
    if @@names_created.include?(candidate_name)
      reset
    else
      @name = candidate_name
      @@names_created << candidate_name
    end
  end

end
