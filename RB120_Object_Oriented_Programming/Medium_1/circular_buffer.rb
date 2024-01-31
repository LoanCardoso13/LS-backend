# rubocop:disable all
=begin

A circular buffer is a collection of objects stored in a buffer that is treated as though it is connected end-to-end in a circle. When an object is added to this circular buffer, it is added to the position that immediately follows the most recently added object, while removing an object always removes the object that has been in the buffer the longest.

This works as long as there are empty spots in the buffer. If the buffer becomes full, adding a new object to the buffer requires getting rid of an existing object; with a circular buffer, the object that has been in the buffer the longest is discarded and replaced by the new object.

Assuming we have a circular buffer with room for 3 objects, the circular buffer looks and acts like this:

P1	P2	P3	Comments
                        All positions are initially empty
1			Add 1 to the buffer
1	2		Add 2 to the buffer
        2		Remove oldest item from the buffer (1)
2	3	Add 3 to the buffer
4	2	3	Add 4 to the buffer, buffer is now full
4		3	Remove oldest item from the buffer (2)
4	5	3	Add 5 to the buffer, buffer is full again
4	5	6	Add 6 to the buffer, replaces oldest element (3)
7	5	6	Add 7 to the buffer, replaces oldest element (4)
7		6	Remove oldest item from the buffer (5)
7			Remove oldest item from the buffer (6)
                        Remove oldest item from the buffer (7)
                        Remove non-existent item from the buffer (nil)

Your task is to write a CircularBuffer class that implements a circular buffer for arbitrary objects. The class should obtain the buffer size with an argument provided to CircularBuffer::new, and should provide the following methods:

put to add an object to the buffer
get to remove (and return) the oldest object in the buffer. It should return nil if the buffer is empty.
You may assume that none of the values stored in the buffer are nil (however, nil may be used to designate empty spots in the buffer).

Examples:

buffer = CircularBuffer.new(3)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

buffer = CircularBuffer.new(4)
puts buffer.get == nil

buffer.put(1)
buffer.put(2)
puts buffer.get == 1

buffer.put(3)
buffer.put(4)
puts buffer.get == 2

buffer.put(5)
buffer.put(6)
buffer.put(7)
puts buffer.get == 4
puts buffer.get == 5
puts buffer.get == 6
puts buffer.get == 7
puts buffer.get == nil

The above code should display true 15 times.

=end
