#! /bin/bash

container/service/wait-for-it.sh -t $ADD_NODES_TIMEOUT openldap:389 -- container/service/add_nodes.sh &
/container/tool/run
