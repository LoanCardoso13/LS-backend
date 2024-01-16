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
  attr_reader :message, :width, :message_line

  def initialize(message, width)
    @message = message
    @width = width
    message_slicer
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+ " + "-"*(width) + " +"
  end

  def empty_line
    "| " + " "*(width) + " |"
  end

  def message_slicer
    @message_line = []
    idx_start = 0
    loop do
      if width < message[idx_start..-1].size
        idx_end = message[0..(idx_start+width)].rindex(' ')
        self.center_words(message[idx_start..idx_end])
        idx_start = idx_end
      else
        self.center_words(message[idx_start..idx_end])
        break
      end
    end
  end

  def center_words(line)
    @message_line << "| #{line.center(width)} |"
  end
end

banner1 = Banner.new('To boldly go where no one has gone before.', 20)
puts banner1
banner2 = Banner.new('To boldly go where no one has gone before.', 80)
puts banner2
