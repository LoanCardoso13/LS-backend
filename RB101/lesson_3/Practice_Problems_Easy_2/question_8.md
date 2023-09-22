# Question
Shorten the following sentence:
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```
Review the `String#slice!` documentation, and use that method to make the return value `"Few things in life are as important as "`. But leave the `advice` variable as `"house training your pet dinosaur."`.

As a bonus, what happens if you use the `String#slice` method instead?
## Answer
```ruby
advice.slice!(...advice.index('house'))
```
Using `String#slice` instead, the only way to modify the local variable `advice` would be through reassigning the return value of the method. Hence the return value and the "effect", that is, the resulting string, would be the same. 