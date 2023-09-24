# Question
One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:
```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```
After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:
```ruby
mess_with_demographics(munsters)
```
Did the family's data get ransacked? Why or why not?
# Answer
Yes, the Munsters family's data was altered. The assignment operations on lines 11 and 12 are mutating in regards to the whole array (although they are non-mutating with regards to the specific element in the array). That means they'll mutate/alter the original object being referenced by the variables given.  
