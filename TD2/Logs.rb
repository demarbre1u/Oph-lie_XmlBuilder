#!/usr/bin/ruby -w

nb_requete = 0
nb_data = 0
liste_machine = {}
fichiers = {}

File.open("TD2/logs", "r") do |file|
  while line = file.gets
    # Traitement
    line =~ /^([^ ]*) .* "[^ ]* ([^ ]*) .* (.*)$/
    nb_requete +=1
    nb_data += $3.to_i if $3 != "-"
    liste_machine[$1] = 1 
    
    if(! fichiers[$2].nil?)
      fichiers[$2] += 1
    else
      fichiers[$2] = 1
    end 
  end
end

puts "Nombre de requêtes : " + nb_requete.to_s
puts "Nombre de données : " + nb_data.to_s
puts "\nListe de machines : "
puts liste_machine.keys() 

puts "\nListe des 5 fichiers les plus demandés : "
sorted = {}
sorted = fichiers.sort {|a1,a2| a2[1]<=>a1[1]}
5.times do |x| 
  puts " - " + sorted[x][0]
end