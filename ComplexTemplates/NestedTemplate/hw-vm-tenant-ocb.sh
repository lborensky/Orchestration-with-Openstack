#!/bin/bash        
# description: création simple VM pour affichage Web UI de la chaîne de caractères "Hello World"
# release: 1.0.0

# Etape 0 - [Opération Manuelle], vérification manuelle des commandes opérationnelles CLI (ex: nova list)

# Etape 1 - [Opération Manuelle], mise à jour avec éditeur de texte, fichier: hw-vm-tenant-ocb.cfg
# Pré-requis, initialisation l'ensemble des variables du fichier de configuration

# Etape 2 - [Opération Automatisée], mode CLI with module Heat

# Lancement de la pile Heat à l'aide du template YAML pour Hello World
ConfigFile=${1:-"hw-vm-tenant-ocb.cfg"}

[ ! -f $ConfigFile ] && {
  echo "$(basename $0): erreur fichier de configuration \"${ConfigFile}\" inexistant"
  echo "exemple: $(basename $0) <fichier-de-configuration>"
  exit ${EXIT:-1}
} || . $ConfigFile

heat stack-create \
  -P "HelloWorldKeyName=$HelloWorldKeyName" \
  -P "HelloWorldFlavorName=$HelloWorldFlavorName" \
  -P "HelloWorldImageID=$HelloWorldImageID" \
  -P "HelloWorldInstanceName=$HelloWorldInstanceName" \
  -P "HelloWorldPublicNetworkName=$HelloWorldPublicNetworkName" \
  -P "HelloWordIPListAccessSSH=$HelloWordIPListAccessSSH" \
  -f hw-vm-tenant-ocb.yaml $HelloWorldStackName

