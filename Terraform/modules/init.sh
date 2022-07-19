
 #!/usr/bin/env bash

YELLOW='\033[1;33m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

while getopts 'le:h' OPTION; do
	case "$OPTION" in
	  l)
	    localauth=1
		;;
	  e)
		environment="$OPTARG"
		;;
	  h|?)
		echo "usage: "
		echo "  $(basename "$0") -e (DEV|QA|Production) [-l|localauth]" >&2
		exit 1
		;;
	esac
done

# Input Validation ######################


if [ -z "$environment" ]; then
	environment="DEV"
	localauth=1
fi


function switch_subscription() {
	local subscription_name="$1"
	local source_file="$2"

    az account set --subscription "$subscription_name"
	az account show
}

# ******
# MAIN
# ******

#TPS DEV; Dev.tfvars
if [[ "$environment" == *DEV ]]; then
	environment="DEV" 
	subscription="860a92c8-e6da-4661-ab4c-5ec45c971380"

#QA Private; QA.tfvars
elif [[ "$environment" == *QA ]]; then
	environment="QA" 
    subscription="16159458-1098-4d77-b09b-68d0bff9cda2"


#Production puublic; Production.tfvars

elif [[ "$environment" == *Production ]]; then
	environment="Production" 
    subscription="9b05f545-c69b-4c3d-8477-3f5dcb23c9b5"

fi

if [ "$localauth" == "1" ]; then
	switch_subscription "$subscription"
fi

./set_env.sh -e "$environment"
./set_backend.sh -e "$environment"
terraform init -reconfigure
