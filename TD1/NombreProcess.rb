#!/usr/bin/ruby -w

puts "Il y a actuellement " + (`ps aux | wc -l`.to_i - 1).to_s + " processus en cours"
