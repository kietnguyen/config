#!/bin/bash

# save and change IFS
OLD_IFS=${IFS}
IFS=$'\n'

BASE_FILE=$(basename "$1")
BASE_DIR=$(dirname "$1")
CWD_DIR=$(pwd)
LOG_FILE='submission.log'

echo "Changing directory to ${BASE_DIR}" &> ${BASE_DIR}/${LOG_FILE}
cd ${BASE_DIR}

echo "Extracting... ${BASE_FILE}" &>> ${LOG_FILE}
mkdir -p zip-temp
unzip ${BASE_FILE} -d zip-temp &>> ${LOG_FILE}

for ZIP_FILE in zip-temp/*; do
  echo &>> ${LOG_FILE}

  NAME=$(echo ${ZIP_FILE} | cut -d '/' -f 2 | cut -d '_' -f 1)

  echo "Create directory... ${NAME}" &>> ${LOG_FILE}
  mkdir -p ${NAME}

  # TODO: detect actual file extension
  #FILE_EXT=${ZIP_FILE##*.}
  FILE_TYPE=$(file -b $ZIP_FILE | egrep -io '^[a-z ]+')
  case "$FILE_TYPE" in
    "RAR archive data")
      FILE_EXT="rar"
      ;;

    "Zip archive data")
      FILE_EXT="zip"
      ;;

    "gzip compressed data")
      FILE_EXT="gz"
      ;;

    "bzip2 compressed data")
      FILE_EXT="bz2"
      ;;

    "7-zip archive data")
      FILE_EXT="7z"
      ;;

    *)
      FILE_EXT=""
      ;;
  esac

  echo "Extracting... $ZIP_FILE" &>> ${LOG_FILE}
  rm -rf file-temp && mkdir $_

  case "$FILE_EXT" in
    "zip")
      unzip "$ZIP_FILE" -d file-temp &>> ${LOG_FILE}
      ;;

    "gz")
      tar zxf "$ZIP_FILE" -C file-temp &>> ${LOG_FILE}
      ;;

    "bz2")
      tar jxf "$ZIP_FILE" -C file-temp &>> ${LOG_FILE}
      ;;

    "rar")
      unrar e "$ZIP_FILE" file-temp &>> ${LOG_FILE}
      ;;

    "7z")
      7z e "$ZIP_FILE" -ofile-temp &>> ${LOG_FILE}
      ;;

    *)
      echo "##########################################" &>> ${LOG_FILE}
      echo ${ZIP_FILE} &>> ${LOG_FILE}
      echo "Unsupported file type:" $(file ${ZIP_FILE}) &>> ${LOG_FILE}
      echo "##########################################" &>> ${LOG_FILE}

      echo "Unsupported file type:" $(file ${ZIP_FILE})
      continue
      ;;

  esac


  echo "Moving files..." &>> ${LOG_FILE}
  for FILE in $(find file-temp -regextype posix-egrep -iregex '^\w\S*\.(h|cpp|py|txt|pdf|doc|docx|odt|jpg|png)$'); do
    if [[ $(basename ${FILE}) == '._'* ]]; then
      continue
    fi

    mv -v ${FILE} ${NAME} &>> ${LOG_FILE}
  done

done

echo
echo "Clean up temp folder..." &>> ${LOG_FILE}
rm -vrf *-temp &>> ${LOG_FILE}

# restore IFS
IFS=${OLD_IFS}

echo
echo "Changing directory back to ${CWD_DIR}" &>> ${LOG_FILE}
cd ${CWD_DIR}
