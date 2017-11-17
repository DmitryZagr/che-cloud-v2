#!/bin/bash

cd ../../data/openldap/backup

file=$1

if [ ! "$file" ];then   
  data=$(ls -t *data* | head -1)
  config=$(ls -t *config* | head -1)
  echo "###############Attempting to backup openldap config with '$config'###############"
  docker exec -i openldap /sbin/slapd-restore 0 $config
  echo "###############Attempting to backup openldap data with '$data'###############"
  docker exec -i openldap /sbin/slapd-restore 1 $data
else
  if [[ $file == *"data"* ]]; then
    echo "###############Attempting to backup openldap data with '$file'###############"
    docker exec -i openldap /sbin/slapd-restore 1 $file
  else
    if [[ $file == *"config"* ]]; then
      echo "###############Attempting to backup openldap config with '$file'###############"
      docker exec -i openldap /sbin/slapd-restore 0 $file
    fi
  fi
fi
