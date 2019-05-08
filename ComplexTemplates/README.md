# Ensemble de complexes templates Heat

Cet espace regroupe plusieurs templates Heat pour couvrir des besoins complexes, tels que:

 1. Imbrication de templates Heat pour améliorer la lisibilité des fichiers HOT,
 2. Création d'un environnement applicatif à base de VM scalables dynamiquement,
 3. Déploiement d'agents logiciels au boot de VM.

 > **Note:** Il est recommandé de lire chaque template Heat afin de s'assurer que les paramètres, les ressources, les valeurs d'attributs, etc. sont en conformité  avec l'environnement d'hébergement utilisé et avec ses propres attentes. Ils ont été validés sur l'une des releases suivantes d'Openstack: **Juno**, **Kilo** et **Ocata**. Les modifier en conséquence, si nécessaire.

### 1. Imbrication de templates Heat
Ce template nommé **vm1.yaml** permet de . 

    $ os stack create -f vm1.yaml STACK-TST-21 ↩

### 2. Environnement applicatif scalable dynamiquement
Ce template nommé **vm2.yaml** permet de . 

    $ os stack create -f vm2.yaml STACK-TST-22 ↩

### 3. Déploiement d'agents logiciels au bout de VM
Ce template "**vm3.yaml**" permet de 

    $ os stack create -f vm3.yaml STACK-TST-23 ↩


<!--stackedit_data:
eyJoaXN0b3J5IjpbLTIyMzc4NTg1NSwtMTIwOTg3NDQ4LC0xOD
AzOTE5NTgzLC02MjIyNDU1NjRdfQ==
-->