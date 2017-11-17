#!/bin/bash

cd build/docker-openldap-backup/image
docker build -t airaketa/openldap:1.1.9 .
cd ../../..
