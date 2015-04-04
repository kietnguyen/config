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

for ZIP_FILE in zip-temp/*.zip; do
  NAME=$(echo "$ZIP_FILE" | cut -d '/' -f 2 | cut -d '_' -f 1)

  echo "Create directory... $NAME" &>> $LOG_FILE
  mkdir -p "$NAME"

  echo "Extracting... $ZIP_FILE" &>> $LOG_FILE
  rm -rf cpp-temp && mkdir cpp-temp
  unzip "$ZIP_FILE" -d cpp-temp &>> $LOG_FILE

  echo "Moving files..." &>> $LOG_FILE
  for CPP_FILE in $(find cpp-temp -regextype posix-egrep -iregex '[^.]*\.(h|cpp|txt|pdf|jpg|png)'); do
    mv -v "$CPP_FILE" "$NAME" &>> $LOG_FILE
  done
done

echo "Clean up temp folder..." &>> $LOG_FILE
rm -vrf *-temp &>> $LOG_FILE

# restore IFS
IFS=$OLD_IFS

echo "Changing directory back to $CWD_DIR" &>> $LOG_FILE
cd "$CWD_DIR"
