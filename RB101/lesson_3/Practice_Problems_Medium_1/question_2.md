# Question
The result of the following statement will be an error:
```ruby
puts "the value of 40 + 2 is " + (40 + 2)
```
Why is this and what are two possible ways to fix this?
# Answer
Ruby doesn't do implicit conversion. The expression being used as argument for the method puts cannot be evaluated, because the string method `.+` does not not accept non-string arguments. To fix we may:
```ruby
puts "the value of 40 + 2 is #{(40 + 2)}"
puts "the value of 40 + 2 is " + (40 + 2).to_s
```