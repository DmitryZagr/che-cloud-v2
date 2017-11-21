#! /bin/bash

COMMAND=/container/service/add_nodes.sh
DONEYET="${COMMAND}.alreadyrun"

export PATH=/usr/bin:$PATH

if [[ -f $DONEYET ]]; then
  exit 1
fi
touch "$DONEYET"

# Put the command you want to run exactly once here:

echo "Adding default nodes..."
ldapadd -x -D cn=admin,dc=base,dc=com -w adminpassword -f /container/service/slapd/assets/default_nodes/add_nodes.ldif

