#!/bin/bash

# Étape 1 : Importer les données de la table VOLS depuis MySQL vers HDFS
sqoop import --connect jdbc:mysql://localhost/DB_AEROPORT --username jamalkarami --password azerty1234567890 --table VOLS --target-dir /user/jamalkarami/vols_data

# Étape 2 : Créer le fichier vols.txt avec les données des 3 vols
echo -e "VOL1,2023-07-30,2023-08-10\nVOL2,2023-08-15,2023-08-25\nVOL3,2023-09-01,2023-09-10" > vols.txt

# Étape 3 : Charger le fichier vols.txt dans HDFS
hdfs dfs -put vols.txt /user/jamalkarami/vols.txt

# Étape 4 : Exporter les données depuis HDFS vers la table VOLS dans MySQL
sqoop export --connect jdbc:mysql://localhost/DB_AEROPORT --username jamalkarami --password azerty1234567890 --table VOLS --export-dir /user/jamalkarami/vols_data --input-fields-terminated-by ','
