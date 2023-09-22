# Question 
Describe the difference between `!` and `?` in Ruby. And explain what would happen in the following scenarios:

1. what is `!=` and where should you use it?
2. put `!` before something, like `!user_name`
3. put `!` after something, like `words.uniq!`
4. put `?` before something
5. put `?` after something
6. put `!!` before something, like `!!user_name`
## Answer
1. It is the not-equal-to conditional operator. It returns true when the values on right and left hand sides are *not* the same. Should be used when a boolean is needed as the result of a comparison. 
2. It evaluates the truthiness of the object assigned to the variable and returns the boolean opposite of this result, i.e. `!variable` will only return `true` if `variable` is either `false` or `nil`.
3. If `!` comes at the end of the name of a method, such as in `words.uniq!`, it is an indication that the method will mutate the caller, in this case the object assigned to `words`, however this is a convention and not a syntax rule. Moreover, it should be noted that a common method such as `.<<` doesn't have `!` and it is mutating. 
4. When used in a ternary expression of the form: `condition ? variable_1 : variable_2`, it will return `variable_1` if `condition` evaluates to `true` and `variable_2` otherwise.
5. When used in a ternary expression of the form: `condition ? variable_1 : variable_2`, it will return `variable_1` if `condition` evaluates to `true` and `variable_2` otherwise. 
6. It gives the boolean associated with the truthiness of the object assigned to the variable (such as `user_name`, in the example). In other words, it will return `true` unless `user_name` is assigned to either `false` or `nil`.