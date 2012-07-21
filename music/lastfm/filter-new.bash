#TODO all file when no file in repo
REPO=./repo

mkdir -p ${REPO}

for TAG in friends recos wish_list
do

     TAG_FILE=niftypuce_tag_${TAG}

     cp -f ~/Downloads/${TAG_FILE}.tsv ${REPO}

     CURRENT_FILE=${REPO}/${TAG_FILE}.tsv 
     OLD_FILE=${REPO}/${TAG_FILE}.csv 
     NEW_FILE=${TAG_FILE}_new.csv 

     comm -23 <(sort ${CURRENT_FILE}) <(sort ${OLD_FILE}) > ${NEW_FILE}

     find . -size 0 -name "*.csv" -exec rm -f '{}' \;  #remove empty files

     mv ${CURRENT_FILE} ${OLD_FILE}

done
