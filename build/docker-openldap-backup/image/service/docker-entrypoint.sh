#! /bin/bash

container/service/wait-for-it.sh -t 600 openldap:389 -- container/service/add_nodes.sh &
/container/tool/run
