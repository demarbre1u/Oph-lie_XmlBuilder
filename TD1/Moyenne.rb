#!/usr/bin/ruby -w

moyenne = 0

for i in 0...10
 puts "Entrez la note n°#{i+1}: " 
 moyenne += gets.strip.to_i
end

moyenne /= 10.0

puts "Votre moyenne est #{moyenne}"