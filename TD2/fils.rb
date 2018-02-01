#!/usr/bin/ruby -w
# -*- coding: utf-8 -*-

# Alimentation du fichier de logs

def info(msg, logfile)
  File.open(logfile, 'a') { |file| file << "[#{Process.pid}] : " + msg + "\n"}
end

#
# Programme principal du fils
#

# Récupération des informations du père

listeFich = ARGV[0]
repDest = ARGV[1]
fichMsg = ARGV[2]
lockfile = ARGV[3]

# Bonjour...

info "ma naissance en tant que fils", fichMsg

# Définition des constantes

#commande = "dvd2dvix --options --qui --vont --bien"
commande = "ls"

# Boucle principale : tant qu'il y a des fichiers à traiter

while !File.zero?(listeFich)

  line = ""

  # On positionne un verrou exclusif

  info "je suis en attente du verrou", fichMsg

  lf = File.new(lockfile)
  lf.flock(File::LOCK_EX)

  info "j'ai la main...", fichMsg

  # On ouvre le fichier
  # s'il y a encore des fichiers à traiter
  # (il est possible que le fichier ait été
  # modifié entre le moment où on a fait le test
  # de la boucle et le moment où le verrou a été posé)

  if !File.zero?(listeFich)
    # On extrait la première ligne
    File.open(listeFich, "r") { |f|	line = f.gets }
    # On supprime la première ligne du fichier...
    `sed -i 1d #{listeFich}`
  end

  # On libère le verrou
  
  info "je vais libérer le verrou", fichMsg

  lf.flock(File::LOCK_UN)
  lf.close

  info "j'ai libéré le verrou", fichMsg

  # On fait le traitement si nécessaire
  # (décommenter la première et commenter la seconde
  # pour lancer le traitement plutôt que d'afficher
  # le nom du traitement)

  # TODO : vérifier que le fichier est exploitable (cf. énoncé)

  if !line.empty? && File.file?(line)
    info "je vais traiter le fichier : #{line}", fichMsg
    `#{commande} #{line} >> #{fichMsg}`
    info "j'ai fini de traiter le fichier : #{line}", fichMsg
  end
  
  # On attend un peu
  
  sleep 1
end

exit 0


