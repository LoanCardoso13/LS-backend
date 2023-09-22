# Question 
The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:
```ruby
numbers = [1, 2, 3, 4, 5]
```

What do the following method calls do (assume we reset numbers to the original array between method calls)?
```ruby
numbers.delete_at(1)
numbers.delete(1)
```
## Answer
The `delete_at(index)` method will delete from the array and return the corresponding element given by the index; in this case: `2`. The `delete(obj)` will delete and return as many elements in the array that are equal to the `obj` and return it; in this case `1`.  