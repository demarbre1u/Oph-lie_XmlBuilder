#!/usr/bin/ruby -w

puts "Entrez la largeur du rectangle : "
largeur = gets.chomp.to_i

puts "Entrez la longueur du rectangle : "
longueur = gets.chomp.to_i

perimeter = (largeur + longueur) * 2
puts "Le périmètre de votre rectangle est : " + perimeter.to_s