# Question 
Starting with the string:
```ruby
famous_words = "seven years ago..."
```
show two different ways to put the expected "Four score and " in front of it.
## Answer
```ruby
famous_words.insert(0, "Four score and ")
famous_words = "Four score and " + famous_words
```
