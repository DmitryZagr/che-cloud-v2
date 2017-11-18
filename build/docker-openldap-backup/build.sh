#!/bin/bash
cd image
docker build -t airaketa/openldap:1.1.9 .
cd ..
