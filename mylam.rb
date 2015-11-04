puts "Pick an odd number - probs a large one would be best:"
width = gets.to_i

require 'prime'

def spiral_draw(x = 0, y = 0)
  Enumerator.new do |yielder|
    yielder << [x, y]                  #
    dx, dy = 0, 1                      #change in x and y is zero and one respectively
    yielder << [x+=dx, y+=dy]
    0.step do |i|
      2.times do
        i.times{ yielder << [x+=dx, y+=dy] }
        dx, dy = -dy, dx
        yielder << [x+=dx, y+=dy]
      end
    end
  end
end
        
