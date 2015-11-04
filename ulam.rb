require 'prime'

def spiral_draw(x=0, y=0)
    Enumerator.new do |yielder|
        yielder << [x, y]                                 # starting position
        dx, dy = 1, 0                                     # first direction - one step to the right. dx = 1, dy = 0
        yielder << [x+=dx, y+=dy]                         # second position - starting position + first direction
        0.step do |i|                                     # iterating over all elements 'i' starting from 0, default of every one step
            2.times do
                i.times{ yielder << [x+=dx, y+=dy] }      # going straight
                dx, dy = dy, -dx                          # 90 degree turn - dx = dy = 0, dy = -dx = -1
                yielder << [x+=dx, y+=dy]                 # x + 0, y + -1
            end # 2.times end
        end # 0.step end
    end # Enumerator end
end # spiral_draw end

def ulam_spiral(num, start=1)
    h = Hash.new(0)
    position = spiral_draw
    (start ... start+num*num).each do |i|
       pos = position.next
       h[pos] = 1  if i.prime?
    end # do end
    
    chr = [" ", "."]
    (xmin, xmax), (ymin, ymax) = h.keys.transpose.map(&:minmax)
    (xmin..xmax).step(2).each do |x|
    puts (ymin..ymax).map{|y| chr[h[[x,y]]][h[[x+1,y]]]}.join
    end
end # ulam_spiral end
          
puts "pick a number:"
num = gets.to_i 
  puts "done! check out test1.txt!"                                 # output to terminal
  $stdout.sync = true
  $stdout = File.new('/home/tinfoilsally/Desktop/test1.txt', 'w')   # write output (spiral only) to text file
ulam_spiral(num)
