#! /bin/bash

ldapadd -x -D "cn=admin,$LDAP_BASE_DN" -w "$LDAP_ADMIN_PASSWORD" -f /container/service/slapd/assets/default_nodes/add_nodes.ldif
code=$?
if [[ "$code" != "0" && "$code" != "68" ]]; then
  pkill -f /container/tool/run
fi
