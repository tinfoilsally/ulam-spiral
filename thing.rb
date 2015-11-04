require 'prime'

puts 'pick a number'
final = gets.to_i

Prime.each(final) do |prime|
puts prime
end
