# Question
What do you expect to happen when the `greeting` variable is referenced in the last line of the code below?
```ruby
if false
  greeting = "hello world"
end

greeting
```
## Answer
The local variable `greeting` is pointing to `nil` because an `if/else` statement does not create a new variable scope. The assignment operation of line 2 does not happen because the condition on line 1 is not met, however the local variable `greeting` is still initialized to `nil`.  