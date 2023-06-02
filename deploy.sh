#!/bin/bash
set -euo pipefail

export WRKDIR=$(pwd)

ENVIRONMENT="${1:-}"

if [[ "$ENVIRONMENT" =~ ^(dev|prod)$ ]]; then
    cd ${WRKDIR}/terraform
    rm -f tfplan
    terraform init -reconfigure -backend-config=${ENVIRONMENT}/backend.tf
    terraform plan -var-file=${ENVIRONMENT}/variables.tfvars -out=tfplan
    terraform apply "tfplan"
else
    echo "ERROR: Specify environment dev/prod" >&2
    exit 1;
fi
    
