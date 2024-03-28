# rubocop:disable all
=begin

  Create a clock that is independent of date.

  You should be able to add minutes to and subtract minutes from the time represented by a given Clock object. Note that you should not mutate Clock objects when adding and subtracting minutes -- create a new Clock object.

  Two clock objects that represent the same time should be equal to each other.

  You may not use any built-in date or time functionality; just use arithmetic operations.

=end

class Clock

  def self.at(hour, minutes = 0)
    Time.new(hour, minutes)  
  end

end

class Time

  def initialize(hour, minutes)
    @hour = hour
    @minutes = minutes
  end

  def to_s
    format('%.2d:%.2d', hour, minutes)
  end

  def +(added_minutes)
    new_minutes = (minutes + added_minutes) % 60
    new_hour = (minutes + added_minutes) / 60 + hour
    new_hour = new_hour % 24

    Time.new(new_hour, new_minutes)
  end

  def -(subtracted_minutes)

    new_hour = hour - (subtracted_minutes / 60)
    new_minutes = minutes - subtracted_minutes % 60

    if new_minutes < 0
      new_hour -= 1
      new_minutes = 60 + new_minutes
    end
    if new_hour < 0
      new_hour = ((-1) * new_hour) % 24
      new_hour = 24 - new_hour
    end

    Time.new(new_hour, new_minutes)
  end

  def ==(other_time)
    self.hour == other_time.hour && self.minutes == other_time.minutes
  end

  protected

  attr_reader :hour, :minutes

end
