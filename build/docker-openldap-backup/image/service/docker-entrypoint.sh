#! /bin/bash

container/service/wait-for-it.sh -t $ADD_DEFAULT_NODES_TIMEOUT --strict openldap:389 -- /container/service/add_nodes.sh &
/container/tool/run
