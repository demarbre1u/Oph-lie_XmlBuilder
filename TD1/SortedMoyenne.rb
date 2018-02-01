#!/usr/bin/ruby -w

notes = []
moyenne = 0  
  
for i in 0...10
  puts "Entrez la note n°#{i+1}: " 
  moyenne += notes[i] = gets.strip.to_i
end

notes.sort!
moyenne /= 10.0

puts "Vos notes triées sont #{notes}"
puts "Votre moyenne est #{moyenne}"