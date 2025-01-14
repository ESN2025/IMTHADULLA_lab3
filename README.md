# Introduction

Dans ce troisième TP, l’objectif est d’ajouter un timer pour mettre à jour automatiquement les trois afficheurs à sept segments de la carte DE10-Lite.
Nous repartons de l’architecture du TP précédent et ajoutons le timer dans Platform Designer.

# Architecture du sytème

<img width="538" alt="synoptic_lab3" src="https://github.com/user-attachments/assets/a7d17297-83c3-411c-a744-bddeb8228fdd" />

L’architecture repose sur les composants suivants :

  - Nios II : Un processeur softcore qui exécute la partie logicielle.
  - RAM : Mémoire utilisée pour stocker les données et les instructions.
  - JTAG : Interface permettant de programmer la carte et d’interagir avec le système.
  - PIO (Parallel Input/Output) : Trois blocs PIO de 4 bits sont ajoutés pour contrôler les trois afficheurs à sept segments.
  - Décodeur bcd_2_seg : Convertit les valeurs en BCD afin d’afficher chaque chiffre sur un afficheur à sept segments.
  - Timer : Génère des interruptions périodiques pour cadencer le compteur.

# Platform Designer

<img width="430" alt="qsys_lab3" src="https://github.com/user-attachments/assets/424d7c62-fdf3-4635-8c23-f5e1cd430678" />

Le timer a été ajouté par rapport au TP 2. Une fois les connexions vérifiées, nous pouvons généré le HDL.

# Quartus et Nios II

Dans Quartus, nous avons conservé la structure précédente avec un fichier Toplevel.vhd qui instancie les décodeurs bcd_2_seg pour les trois afficheurs.
Après la compilation et en l’absence d’erreurs, l’architecture peut être flashée sur la carte.

Nous pouvons alors coder la partie software dans un fichier main.c. Le programme initialise la fonction d’interruption du timer, qui génère des interruptions
périodiques. À chaque interruption, la valeur du compteur global (counter) est incrémentée.

Le programme principal vérifie si une interruption a eu lieu et, dans ce cas :

  - Il convertit la valeur de counter en chiffres individuels pour les unités, dizaines et centaines.
  - Il met à jour les afficheurs à sept segments avec ces valeurs.

Le processus se répète indéfiniment.

# Resultat
Voici le résultat du programme :

https://github.com/user-attachments/assets/19993818-70bf-4652-8d13-e8d3bfd709fe

Les trois afficheurs à sept segments s’incrémentent comme un compteur toutes les secondes, avec une précision supérieure aux délais utilisés dans le précédent TP.

# Conclucion
Ce dernier TP a permis de mettre en œuvre une interruption liée au timer, 
offrant une précision de comptage nettement supérieure par rapport aux méthodes précédemment utilisées.
