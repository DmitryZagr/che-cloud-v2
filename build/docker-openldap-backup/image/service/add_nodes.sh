#! /bin/bash

echo "Adding default nodes..."
ldapadd -x -D cn=admin,dc=base,dc=com -w adminpassword -f /container/service/slapd/assets/default_nodes/add_nodes.ldif

