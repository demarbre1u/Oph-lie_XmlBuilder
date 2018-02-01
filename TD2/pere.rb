#!/usr/bin/ruby -w
# -*- coding: utf-8 -*-

# Père

require 'fileutils'
require 'tempfile'

require 'etc'

# Récupération des informations

if ARGV.length != 1
  puts "Usage: #{$0} <source directory>"
  exit
end

# Définition des constantes

nb_processus = Etc.nprocessors
rep_source = ARGV[0]
liste_fichiers = 'liste_fichiers.txt'
nom_fils = './fils.rb'
rep_destination = './'
fich_logs = 'messages.log'
lockfile = Tempfile.new('encod')

# Algo en lui-même


# On crée la liste des fichiers à traiter

File.open(liste_fichiers, "w") do |f|
  Dir.open(rep_source) do |rep|
    rep.each do |nom|
      f << nom << "\n" if File.lstat(rep_source + nom).file?
    end
  end
end

# On initialise le fichier des logs et celui des verrous

FileUtils::rm_rf(fich_logs)
FileUtils::touch(fich_logs)
FileUtils::touch(lockfile.path)

# On lance les fils

1.upto(nb_processus) do
  fork { exec(nom_fils, liste_fichiers, rep_destination, fich_logs, lockfile.path) }
end

# On attend la fin des fils

1.upto(nb_processus) do
  pid = Process.wait
  File.open(fich_logs, 'a') do |file|
    file <<  "Mon fils #{pid} est terminé avec le code de retour #{$?.exitstatus}!" + "\n"  
  end
end

# Ménage

`rm #{liste_fichiers}`
