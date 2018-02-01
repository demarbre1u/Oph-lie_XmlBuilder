#!/usr/bin/ruby -w

i = 1
puts "Avec un while"
while i <= 20 
  puts i
  i += 1
end

puts "Avec un for"
for i in 1..20
  puts i
end

puts "Avec un itérateur"
1.upto(20) { |x| print x, ' ' }