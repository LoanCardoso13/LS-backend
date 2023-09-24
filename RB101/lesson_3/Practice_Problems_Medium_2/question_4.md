# Question
To drive that last one home...let's turn the tables and have the string show a modified output, while the array thwarts the method's efforts to modify the user's version of it.
```ruby
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```
## Answer
The code outputs the following:
```ruby
"My string looks like this now: pumpkinsrutabaga
My array looks like this now: ['pumpkins']"
```
The string was modified because of the `tricky_method_two` use of the `String#<<` which mutates its argument, just like in the previous problem. The array will **not** be altered because line 3 is a re-assignment, which means that thence `an_array_param` is pointing to a different object. The original, given by the local variable used as argument `my_array`, is not modified. 