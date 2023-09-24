# Question
Let's take a look at another example with a small difference in the code:
```ruby
a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id
```
## Answer
They'll all have the same object id's because integer's object id's are uniquely defined. 