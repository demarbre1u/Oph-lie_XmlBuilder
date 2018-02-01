#!/usr/bin/ruby -w

file = File.new("annuaire", "r")
annuaire = {}
  
while line = file.gets
  annuaire[ line[/[^ :]*/].downcase ] = line[/[^ :]*$/].strip
end

file.close
  
puts annuaire.sort()

puts "Veuillez entrer le nom de la personne dont vous souhaitez connaitre le numéro : "
name = gets.strip.downcase

if annuaire.key?(name)
  puts "Le numéro de #{name} est #{ annuaire.fetch(name) }"
else
  puts "La personne demandée n'existe pas dans l'annuaire "
end