# Question
Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like `<<` or `+` for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to concatenate an element to the buffer?
```ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end
```
# Answer
The `rolling_buffer1` method will modify `buffer` each time it is used, whereas the `rolling_buffer2` will create a new `buffer`, in a different place in memory, each time it is used. Although they have the same return value, the first returns a reference to the same input object, however modified, and the second returns a reference to a new object. 