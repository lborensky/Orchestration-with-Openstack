#!/bin/bash        
# description: création de VM pour l'application WordPress (2 VM: FrontEnd & BackEnd)
# release: 1.0.0

# Etape 0 - [Opération Manuelle], vérification manuelle des commandes opérationnelles CLI (ex: nova list)

# Etape 1 - [Opération Manuelle], mise à jour avec éditeur de texte, fichier: wp-vm-tenant-ocb.cfg
# Pré-requis, initialisation l'ensemble des variables du fichier de configuration

# Etape 2 - [Opération Automatisée], mode CLI with module Heat
# Lancement de la pile Heat à l'aide du template YAML
ConfigFile=${1:-"wp-vm-tenant-ocb.cfg"}

[ ! -f $ConfigFile ] && {
  echo "$(basename $0): erreur fichier de configuration \"${ConfigFile}\" inexistant"
  echo "exemple: $(basename $0) <fichier-de-configuration>"
  exit ${EXIT:-1}
} || . $ConfigFile

heat stack-create \
  -P "WordPressKeyName=$WordPressKeyName" \
  -P "WordPressInstanceName=$WordPressInstanceName" \
  -P "WordPressFrontEndFlavorName=$WordPressFrontEndFlavorName" \
  -P "WordPressBackEndFlavorName=$WordPressBackEndFlavorName" \
  -P "WordPressImageID=$WordPressImageID" \
  -P "WordPressDataBaseName=$WordPressDataBaseName" \
  -P "WordPressUserDataBaseName=$WordPressUserDataBaseName" \
  -P "WordPressPublicNetworkName=$WordPressPublicNetworkName" \
  -P "WordPressPrivateNetworkName=$WordPressPrivateNetworkName" \
  -P "WordPressIPListAccessSSH=$WordPressIPListAccessSSH" \
  -f wp-vm-tenant-ocb.yaml $WordPressStackName

