# Question
Consider these two simple methods:
```ruby
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end
```
What would be the return value of the following method invocation?
```ruby
bar(foo)
```
# Answer
`"no"`