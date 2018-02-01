#!/bin/bash

if [ $# -lt 1 ] && [ -f "$1" ]; then
    echo "Erreur : nom de fichier xml invalide ou non précisé"
    exit 1
fi

rm /usr/local/www/apache24/data/ophelie/pages/"$1" 2>/dev/null
cp "$1" /usr/local/www/apache24/data/ophelie/pages/ok.xml 2>/dev/null
echo "Déplacement de $1 effectué avec succès." 
exit 0
