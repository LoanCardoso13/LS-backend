# Question
We have most of the Munster family in our age hash:
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
```
add ages for Marilyn and Spot to the existing hash
```ruby
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
```
## Answer
```ruby
ages.merge!(additional_ages)
```