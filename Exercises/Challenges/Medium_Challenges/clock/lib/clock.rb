=begin

  Create a clock that is independent of date.

  You should be able to add minutes to and subtract minutes from the time represented by a given Clock object. Note that you should not mutate Clock objects when adding and subtracting minutes -- create a new Clock object.

  Two clock objects that represent the same time should be equal to each other.

  You may not use any built-in date or time functionality; just use arithmetic operations.

=end

class Clock
  def self.at(hours, minutes = 0)
    new(hours, minutes)
  end

  def initialize(hours, minutes = 0)
    @hours = hours
    @minutes = minutes
  end

  def to_s
    format("%.2d:%.2d", hours, minutes)
  end

  def +(minutes)
    hours = minutes / 60
    minutes %= 60

    new_minutes = self.minutes + minutes
    hours += 1 if new_minutes / 60 > 0
    new_minutes %= 60

    new_hours = self.hours + hours
    new_hours %= 24

    Clock.at(new_hours, new_minutes)
  end

  def -(minutes)
    current_minutes = (hours * 60) + self.minutes
    new_minutes = current_minutes - minutes

    if new_minutes >= 0
      new_minutes %= 24 * 60
      new_hours = new_minutes / 60
      new_minutes %= 60

    else
      new_minutes = new_minutes.abs % (24 * 60)
      new_minutes = (24 * 60) - new_minutes
      new_hours = new_minutes / 60
      new_minutes %= 60

    end

    Clock.at(new_hours, new_minutes)
  end

  def ==(other_clock)
    hours == other_clock.hours && minutes == other_clock.minutes
  end

  protected

  attr_reader :hours, :minutes
end
