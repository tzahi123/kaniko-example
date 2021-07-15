#!/bin/bash

#------------------------------------------------------
# function Usage
#------------------------------------------------------
function Usage() {
  echo "Usage: $0  -n <Namespace> -s <REGISTRY_SERVER> -u <REGISTRY_USER> -p <REGISTRY_PASSWORD> -e <REGISTRY_EMAIL>"
  exit 1
}

#------------------------------------------------------
# function get_params
#------------------------------------------------------

function get_params() {
  while getopts :c:n: opt; do
    case "$opt" in
    n) NAMESPACE="$OPTARG" ;;
    s) REGISTRY_SERVER="$OPTARG" ;;
    u) REGISTRY_USER="$OPTARG" ;;
    p) REGISTRY_PASSWORD="$OPTARG" ;;
    e) REGISTRY_EMAIL="$OPTARG" ;;
    *) Usage ;;
    esac
  done
  [[ -z "$NAMESPACE"    ]] && echo "Missing Namespace."    && Usage
  [[ -z "$REGISTRY_SERVER"  ]] && echo "Missing Registry server."    && Usage
  [[ -z "$REGISTRY_USER"    ]] && echo "Missing Registry user."    && Usage
  [[ -z "$REGISTRY_PASSWORD"    ]] && echo "Missing Registry password."    && Usage
  [[ -z "$REGISTRY_EMAIL"    ]] && echo "Missing Registry email."    && Usage
}
#
# MAIN
#
get_params $*

kubectl -n ${NAMESPACE} create secret docker-registry regcred \
   --docker-server=${REGISTRY_SERVER} \
   --docker-user=${REGISTRY_USER} \
   --docker-password=${REGISTRY_PASSWORD} \
   --docker-email=${REGISTRY_EMAIL}
