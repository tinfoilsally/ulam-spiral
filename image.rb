require 'prime'
require 'rmagick'
include Magick

watermark = Image.new(1200, 1200)
watermark_text = Draw.new

def block
10.times do
puts "X"
end
watermark_text.annotate(watermark, 0,0,0,0, "#{block}") do

#def spiral_generator(x=0, y=0)
#  Enumerator.new do |yielder|
#    yielder << [x, y]                           # start position
#    dx, dy = 0, 1                               # first direction
#    yielder << [x+=dx, y+=dy]                   # second position
#    0.step do |i|
#      2.times do
#        i.times{ yielder << [x+=dx, y+=dy] }    # going straight
#        dx, dy = -dy, dx                        # 90 degree turn
#        yielder << [x+=dx, y+=dy]
#      end
#    puts "X"
#    end
#  end
#end
 
#[101].each do |n|
#  spiral_generator(n)
#end
#end




  watermark_text.gravity = CenterGravity
  self.pointsize = 50
  self.background = "gray"
  self.font_family = "Arial"
  self.font_weight = BoldWeight
  self.font_color = "black"
  self.stroke = "none"
end
end
watermark.write("/home/tinfoilsally/Desktop/test.bmp")
exit


