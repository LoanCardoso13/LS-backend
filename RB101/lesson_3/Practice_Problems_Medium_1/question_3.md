# Question
Alan wrote the following method, which was intended to show all of the factors of the input number:
```ruby
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end
```
Alyssa noticed that this will fail if the input is `0`, or a negative number, and asked Alan to change the loop. How can you make this work without using the `begin`/`end` `until` construct? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.
# Answer
```ruby
def factors(number)
  return puts "Invalid number. Must be > 0." if number <=0
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end 
  factors
end
```
**Bonus 1**

`number % divisor == 0` checks if the division does not have a remainder.

**Bonus 2**

The last line of the method definition will provide the value to be returned when the method is invoked, if no `return` is run before.