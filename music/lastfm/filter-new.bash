#!/bin/bash

#TODO all file when no file in repo

REPO=./repo
DL=~/Downloads

mkdir -p ${REPO}

for TAG in friends recos wish_list
do
     echo "Scanning file for ${TAG}"

     TAG_FILE=niftypuce_tag_${TAG}
     SOURCE_FILE=${DL}/niftypuce_tag_${TAG}.tsv

     if [ -f ${SOURCE_FILE} ]  
     then 
	  echo "Found ${TAG_FILE}"
     	  cp -f ${SOURCE_FILE} ${REPO}

    	  CURRENT_FILE=${REPO}/${TAG_FILE}.tsv 
     	  OLD_FILE=${REPO}/${TAG_FILE}.csv 
    	  NEW_FILE=${TAG_FILE}_new.csv 

	  head -1 ${CURRENT_FILE} > ${NEW_FILE}
     	  comm -23 <(sort ${CURRENT_FILE}) <(sort ${OLD_FILE}) >> ${NEW_FILE}

     	  find . -size 0 -name "*.csv" -exec rm -f '{}' \;  #remove empty files

     	  mv ${CURRENT_FILE} ${OLD_FILE}
     	  rm ${SOURCE_FILE} 
     
     fi 

done
