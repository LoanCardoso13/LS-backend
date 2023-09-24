# Question
How could the following method be simplified without changing its return value?
```ruby
def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end
```
## Answer
```ruby
def color_valid(color)
  color == "blue" || color == "green"
end
```