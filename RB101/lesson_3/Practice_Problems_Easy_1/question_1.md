# Question 1
What would you expect the code below to print out?

```ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
```
## Answer
It will print [1, 2, 3, 3] because the uniq method is non-mutating, therefore it did not change its caller, the array referred by variable numbers, in any way. 