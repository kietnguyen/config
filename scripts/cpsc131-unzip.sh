#!/bin/bash

# save and change IFS
OLD_IFS=$IFS
IFS=$'\n'

BASE_FILE=$(basename "$1")
BASE_DIR=$(dirname "$1")
CWD_DIR=$(pwd)
LOG_FILE='submission.log'

echo "Changing directory to $BASE_DIR" &> $BASE_DIR/$LOG_FILE
cd "$BASE_DIR"

echo "Extracting... $BASE_FILE" &>> $LOG_FILE
mkdir -p zip-temp
unzip "$BASE_FILE" -d zip-temp &>> $LOG_FILE

for ZIP_FILE in zip-temp/*; do
  NAME=$(echo "$ZIP_FILE" | cut -d '/' -f 2 | cut -d '_' -f 1)

  echo "Create directory... $NAME" &>> $LOG_FILE
  mkdir -p "$NAME"

  FILE_EXT="${ZIP_FILE##*.}"
  if [ "$FILE_EXT" != "zip" ]; then
    echo "########################################" &>> $LOG_FILE
    echo "$ZIP_FILE" &>> $LOG_FILE
    echo "########################################" &>> $LOG_FILE
    continue;
  fi

  echo "Extracting... $ZIP_FILE" &>> $LOG_FILE
  rm -rf file-temp && mkdir file-temp
  unzip "$ZIP_FILE" -d file-temp &>> $LOG_FILE

  echo "Moving files..." &>> $LOG_FILE
  shopt -s nocasematch
  for FILE in $(find file-temp -regextype posix-egrep -iregex '^\w\S*\.(h|cpp|py|txt|pdf|doc|docx|odt|jpg|png)$'); do
    mv -v "$FILE" "$NAME" &>> $LOG_FILE
  done
  shopt -u nocasematch

done

echo "Clean up temp folder..." &>> $LOG_FILE
rm -vrf *-temp &>> $LOG_FILE

# restore IFS
IFS=$OLD_IFS

echo "Changing directory back to $CWD_DIR" &>> $LOG_FILE
cd "$CWD_DIR"
