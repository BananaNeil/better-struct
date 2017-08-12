# better-struct
Like OpenStruct, but better!

# So, why?
OpenStruct is great for hacking together something quick. But the problem is that every undefined method returns nil, which can make simple mistakes difficult to find.

# BetterStruct
```
class Puppy < BetterStruct
  required_parameters :name, :type
  optional_parameters :color, :size

end
```

Ruby:
```
require 'better_struct'
> true

neil = Puppy.new(name: "Neil", type: "Golden Retriever", size: :tiny) 
neil.name
> 'Neil'
neil.size
> :tiny
neil.fetch!
> NoMethodError: undefined method `fetch!' for #<Puppy:0x007ff4ce0c6f28>
```
