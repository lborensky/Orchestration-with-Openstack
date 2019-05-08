# Ensemble de riches templates Heat

Cet espace regroupe plusieurs templates Heat pour couvrir des besoins applicatifs, tels que:

 1. Création d'une VM avec un serveur HTTP,
 2. Création d'une VM avec WordPress pour accès via Internet
 3. Création de deux VM avec WordPress (Front et Back Office) pour accès via Internet,
 4. Création d'une VM qui déclenche un Playbook Ansible,
 5. Création d'une VM avec gestion de configuration logicielle,
 6. Création d'une cluster à base de VM scalables manuellement.
 
 > **Note:** Il est recommandé de lire chaque template Heat afin de s'assurer que les paramètres, les ressources, les valeurs d'attributs, etc. sont en conformité  avec l'environnement d'hébergement utilisé et avec ses propres attentes. Ils ont été validés sur l'une des releases suivantes d'Openstack: **Juno**, **Kilo** et **Ocata**. Les modifier en conséquence, si nécessaire.

### 1. Création d'une VM avec HTTPD
Ce template nommé **vm2.yaml** permet de . 

    $ os stack create -f simple-instance.yaml STACK-TST-11 ↩

### 2. Création d'une VM avec WordPress
Ce template nommé **2vm3.yaml** permet de . 

    $ os stack create -f vm2.yaml STACK-TST-12 ↩

### 3. Création des 2 VM (FO & BO) pour WordPress
Ce template "**2vm3.yaml**" permet de 

    $ os stack create -f 2vm3.yaml STACK-TST-13 ↩

### 4. Création d'une VM associée à un Playbook Ansible
Ce template **vm4.yaml** permet 

    $ os stack create -f vm4.yaml STACK-TST-14 ↩

### 5. Création d'une VM avec gestion de configuration logicielle
Ce template **vm5.yaml** permet de

    $ os stack create -f vm5.yaml STACK-TST-15 ↩

### 6. Création de VM d'un cluster scalable manuellement
Ce template **vm6.yaml** permet 

    $ os stack create -f vm6.yaml STACK-TST-16 ↩

<!--stackedit_data:
eyJoaXN0b3J5IjpbNDExNDk0ODQ3LC0xNDQ2MDQzNzU3LC00MD
A4NTg2NjYsMTA2MDM0MDA4MywtNjIyMjQ1NTY0XX0=
-->