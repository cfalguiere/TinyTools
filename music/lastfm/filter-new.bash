
REPO=./repo

mkdir -p ${REPO}

FRIENDS_FILE=niftypuce_tag_friends

cp -f ~/Downloads/${FRIENDS_FILE}.tsv ${REPO}

CURRENT_FILE=${REPO}/${FRIENDS_FILE}.tsv 
OLD_FILE=${REPO}/${FRIENDS_FILE}.csv 
NEW_FILE=${FRIENDS_FILE}_new.csv 

comm -23 <(sort ${CURRENT_FILE}) <(sort ${OLD_FILE}) > ${NEW_FILE}

mv ${CURRENT_FILE} ${OLD_FILE}
