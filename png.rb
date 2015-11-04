require 'chunky_png'
require 'prime'

image = ChunkyPNG::Image.new(1600, 1600, ChunkyPNG::Color::TRANSPARENT)
def pos(x=0, y=0)
    Enumerator.each do |yielder|
        yielder << [x, y]
        pos = sum x+y

    (0...image.height).each do |y|
        (0...image.width).each do |x|
            ChunkyPNG::Color('black') if pos.isprime ?
end
    
image.save('tester.png')
