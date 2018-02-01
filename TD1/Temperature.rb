#!/usr/bin/ruby -w

temp = []

File.open("temperatures", "r") do |file|
  while line = file.gets
    # Attention a ne pas oublier to_f, sinon les comparaisons se font sur des string, pas sur des number
    temp << line.strip.to_f
  end
end

puts "Min : #{temp.min}"
puts "Max : #{temp.max}"

somme = temp.inject(:+)
puts "Moyenne : #{somme / temp.size().to_f}"