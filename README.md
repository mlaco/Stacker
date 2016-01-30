# Stacker
Live out all your wildest object-stacking fantasies.

                  <-------- d ------->
      
      DDDDDDDDDDDD                        ^
            DDDDDDDDDDDD                  |
               DDDDDDDDDDDD               |
                 DDDDDDDDDDDD             |
                  DDDDDDDDDDDD            |
                    DDDDDDDDDDDD          |
                     DDDDDDDDDDDD         |
                      DDDDDDDDDDDD
                      DDDDDDDDDDDD        h
                       DDDDDDDDDDDD
                        DDDDDDDDDDDD      |
                        DDDDDDDDDDDD      |
                         DDDDDDDDDDDD     |
                         DDDDDDDDDDDD     |
                          DDDDDDDDDDDD    |
                          DDDDDDDDDDDD    |
                          DDDDDDDDDDDD    v

It is physically possible to create a stack of identical objects such that the top object is an arbitrary horizontal distance (d) away from the base. Really! However far you want the top to be from the base, it can be accomplished! 7 domino widths, 1 meter, 1 kilometer, a lightyear, it can be done! Assuming that you have a large enough space with uniform gravity, no wind or other disturbances, and a very steady hand...

## Usage

```ruby
# Create a new Stacker
stacker = Stacker.new

# Add some dominoes to the stack
stacker.add_dmnos(20)

# Behold the horizontal distance of the top domino, in domino half-widths
stacker.d_rel 0, 20 => 3.597
```

Stacker builds the stack by taking the previous stack and placing it on top of another domino (see "The Math(s)"). At each step, it shifts the stack as far over as possible, within a parameter `eps`, without allowing the stack to fall. The smaller `eps`, the more efficiently the stack will give you displacement for each added domino.

## The Math(s)

It's all about center of mass. If you look at the top _n_ dominoes, they won't fall of the domino below them as long as their center of mass is above it.

While you wouldn't build a stack from the top, its easiest to do the math if you imagine adding new domino to the bottom, rather than the top. This is because if you do it this way, then the new domino doesn't affect the rest, since it's below them. If you added it to the top, you would have to shift all the dominos below in order to keep the stack stable.

_(More to follow...)_
