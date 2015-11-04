require 'prime'
 
def spiral_draw(x=0, y=0)

  Enumerator.new do |p|
    p << [x, y]                            # starting position
    dx, dy = 1, 0                           # first direction - one step to the right. dx = 1, dy = 0
    p << [x+=dx, y+=dy]                    # second position - starting position + first direction
    0.step do |i|                           # iterating over all elements 'i' starting from 0, default of every one step
      2.times do
        i.times{ p << [x+=dx, y+=dy] }     # going straight
        dx, dy = dy, -dx                    # 90 degree turn - dx = dy = 0, dy = -dx = -1
        p << [x+=dx, y+=dy]                # x + 0, y + -1
      end
    end
  end
end
 
def ulam_spiral(n, start=1)
  h = Hash.new(0)
  position = spiral_draw
  (start ... start+n*n).each do |i|
    pos = position.next
    h[pos] = 1  if i.prime?
  end
  
puts "Pick an odd number - probs a large one would be best:"
inp = gets.to_i
if inp.even?
    puts "Dude, it really ought to be an odd number."
else 
#show_spiral(9)
#show_spiral(25)
show_spiral(inp, "█ ")
end    
