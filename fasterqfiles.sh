#!/bin/bash

# Só é necessário este comando para começar a descarregar
# ~/o_teu_caminho/fasterqfiles.sh


# Põe na variável ids os accession numbers 
ids=$(cut -d "-" -f 1 SraAccList.txt)
names=$(cut -d " " -f3,3 SraAccList.txt)

for id in $ids; do
	fasterq-dump $id #Realiza o fasterq-dump 
	gzip $id.fastq #Zip dos ficheiros fastq
done
