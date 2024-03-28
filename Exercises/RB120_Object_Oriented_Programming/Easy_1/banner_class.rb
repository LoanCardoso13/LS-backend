# rubocop:disable all
=begin

Behold this incomplete class for constructing boxed banners.

class Banner
  def initialize(message)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
  end

  def empty_line
  end

  def message_line
    "| #{@message} |"
  end
end

Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. However, do not make the implementation details public.

You may assume that the input will always fit in your terminal window.

Test Cases

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

banner = Banner.new('')
puts banner
+--+
|  |
|  |
|  |
+--+

=end

class Banner
  attr_reader :width
  attr_accessor :message

  def initialize(message, width = 0)
    @message = message
    @width = width == 0 ? message.size : width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def empty_line
    "| #{' ' * (width)} |"
  end

  def horizontal_rule
    "+-#{'-' * (width)}-+"
  end

  def message_line
    if message.size <= width
      "| #{message.center(width)} |"
    else
      multi_line = []
      while message.size > width      
        stop_idx = message[0..width].rindex(' ')
        substring = message[0...stop_idx]
        self.message = message[(stop_idx+1)..-1]
        multi_line << "| #{substring.center(width)} |"
      end
      multi_line << "| #{message.center(width)} |"
      multi_line.flatten
    end
  end
end

puts Banner.new('')
puts Banner.new('To boldly go where no one has gone before.')
puts Banner.new('To boldly go where no one has gone before.', 80)
txt = 'To boldly go where no one has gone before. '*7
puts Banner.new(txt, 80)
