# Question 
If we build an array like this:
```ruby
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
```
We will end up with this "nested" array:
```ruby
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
```
Make this into an un-nested array.
## Answer
```ruby
flintstones.flatten!
```