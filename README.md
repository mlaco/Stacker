# Stacker
Experimental Ruby domino stacker

Live out all your wildest object-stacking fantasies.

      <----- d ----->
               [    ]  ^
             [    ]    |
           [    ]      |
         [    ]        h
       [    ]          |
      [    ]           |
     [    ]            v


It is physically possible to create a stack of identical objects such that the top object is an arbitrary horizontal distance (d) away from the base. Really! However far you want the top to be from the base, it can be accomplished! Assuming that you have a large enough space with uniform gravity, no wind or other disturbances, and a very steady hand...

## Usage

```ruby
# Create a new Stacker
stacker = Stacker.new

# Add some dominoes to the stack
stacker.add_dmnos(20)

# Behold the horizontal distance of the top domino
stacker.d_rel 0, 20 => 3.597
```
