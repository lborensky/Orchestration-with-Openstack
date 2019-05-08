# Ensemble de simples templates Heat

Cet espace regroupe plusieurs templates Heat pour couvrir des besoins élémentaires, tels que:

 1. Création d'une simple VM attachée au réseau principal du tenant,
 2. Mise à jour d'une simple VM crée depuis un template Heat,
 3. Création d'une simple VM attachée au réseau du tenant et avec une adresse IP flottante d'accès Internet,
 4. Création d'un réseau et d'une simple VM associée avec une adresse IP flottante d'accès à Internet,
 5. Création d'une simple VM avec la création d'une clé SSH associée,
 6. Création d'une VM avec un espace de stockage de type FileSystem monté sur un répertoire de la VM,
 7. Création d'une VM avec une adresse IP publique donnée en paramètre,
 8. Création d'une VM avec la configuration de ports réseau (ingress et engress) de type Security Group. 

 > **Note:** Il est recommandé de lire chaque template Heat afin de s'assurer que les paramètres, les ressources, les valeurs d'attributs, etc. sont en conformité  avec l'environnement d'hébergement utilisé et avec ses propres attentes. Ils ont été validés sur l'une des releases suivantes d'Openstack: **Juno**, **Kilo** et **Ocata**. Les modifier en conséquence, si nécessaire.

### 1. Création d'une simple VM sans accès Internet
Ce template nommé **simple-instance.yaml** permet de créer une VM. Les valeurs de paramètres par défaut du template sont à actualiser par rapport au contexte Cloud utilisé. Quatre paramètres peuvent être utilisés en ligne de commande:

 - **KeyName**: nom de la clé SSH utilisée, 
 - **VMName**: nom de la VM,
 - **Network**: nom du réseau d'accueil de la VM,
 - **Image**: ID de l'image OS associée à la VM.

Le gabarit de la VM (flavor) est à renseigner dans la section ressources du template. A défaut, modifier le template pour le passer en paramètre. 

Pour créer la VM à l'aide du template, lancez la commande ci-dessous. Une fois la VM à l'état ACTIVE, elle ne peut être accédée avec son adresse privée que du réseau sur lequel elle est associée. 

    $ os stack create -f simple-instance.yaml STACK-TST-01 ↩

Pour vérifier l'avancement et l'état du déploiement des piles d'exécution des templates, lancez la commande suivante:

    $ os stack list STACK-TST-01 ↩

Pour supprimer la VM et la pile Heat associée à l'aide du template, lancez la commande suivante:

    $ os stack delete STACK-TST-01 ↩

Pour vérifier l'état de la pile 

### 2. Mise à jour d'une simple VM sans accès Internet
Sur la base du template précédent **simple-instance.yaml**, la mise à jour de la pile relative à la VM à l'état ACTIVE concerne le changement de son gabarit . Pour ce faire, il faut solliciter la pile à l'aide de la commande CLI et de l'action update en ajoutant à la ligne de commande l'option relative au changement de valeur du paramètre en question.

    $ os stack update -P "Flavor=t1.standard.large-1" STACK-TST-01 --template-file simple-instance.yaml ↩

### 3. Création d'une simple VM avec IP publique
Ce template "**simple-instance-with-floating-ip.yaml**" est similaire au template "**simple-instance.yaml**", mais fournit en plus de l'adresse privée, une adresse publique accessible depuis Internet. Cinq paramètres sont disponibles en mode CLI, dont le gabarit (flavor) de la VM. La partie "output" de la pile affiche l'adresse IP publique créée. A ce stade, la VM ne peut être accédée depuis Internet, car les Security Groups ou les règles de Firewall ne sont pas établies (ingress port: 22). Cette action peut-être effectuée en actualisant le template, voire les configurer à l'aide de l'outil CLI Openstack. 

Pour créer la VM à l'aide du template, lancez la commande suivante:

    $ os stack create -f simple-instance-with-floating-ip.yaml STACK-TST-03 ↩
   
 Pour connaître les détails des traitements de la pile, lancez la commande suivante:
 
     $ os stack show STACK-TST-03 ↩ 

### 4. Création d'un réseau et d'une VM avec IP publique 
Ce template **create-net-with-interface-to-internet-and-vm.yaml** permet de créer un réseau et un sous-réseau via le module Neutron sur lequel une VM est instanciée comprenant une adresse IP privée et publique. Il ne porte pas la sécurité d'accès avec les filtres IP sur la VM (Security Group), ni même sur le réseau (Firewall). L'exécution de la pile du template retourne l'adresse IP privée et publique. Seulement deux paramètres sont configurés dans le template, à savoir:

 - **VM_Name**: nom de la VM,
 - **Private_Name_Net**:  nom du réseau privé créé.
 
Pour créer le réseau, le sous-réseau et la VM, lancez la commande suivante:

    $ os stack create -f create-net-with-interface-to-internet-and-vm.yaml STACK-TST-04 ↩

### 5. Création d'une simple VM avec génération d'une clé SSH
Ce template **SSHKeysTemplate.yaml** permet de

    $ os stack create -f SSHKeyTemplate.yaml STACK-TST-05 ↩

### 6. Création d'une VM avec la création d'un FileSystem (vierge) 
Ce template **create-vm-with-FS.yaml** permet de

    $ os stack create -f SSHKeyTemplate.yaml STACK-TST-06 ↩

### 7. Création d'une VM avec une adresse privée donnée en paramètre
Ce template **create-vm-with-fixed-private-ip-address.yaml** permet de

    $ os stack create -f SSHKeyTemplate.yaml STACK-TST-07 ↩

### 8. Création d'une VM avec configuration de Security Group
Ce premier template **create-vm-with-simple-security-group.yaml** permet de créer une à deux règles de Security Group associé à une VM

    $ os stack create -f SSHKeyTemplate.yaml STACK-TST-08a ↩

Ce deuxième template **create-vm-with-many-security-groups.yaml** permet de créer un nombre important de règles de Security Group à l'aide de fonctions Heat pour la VM associée.

    $ os stack create -f SSHKeyTemplate.yaml STACK-TST-08b ↩

<!--stackedit_data:
eyJoaXN0b3J5IjpbMjA5MTkzNzgxNSwtNzg1MjI5MDcwLC02Mj
IyNDU1NjRdfQ==
-->