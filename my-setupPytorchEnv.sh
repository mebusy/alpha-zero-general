#!/bin/sh

set -e

envFolder=alphaZeroEnv

alias pythonExec=python3.10

# if not exist, create a new virtual environment
if [ ! -d "$envFolder" ]; then
    echo "Creating virtual environment..."
    python3.10 -m venv $envFolder
fi


# if $VIRTUAL_ENV  has suffix  $envFolder
if [[ "$VIRTUAL_ENV" == *"$envFolder" ]]; then
    # if pytorch is not installed, install it
    if ! pythonExec -c "import torch" &> /dev/null; then
        echo "Installing required packages..."
        pythonExec -m pip install --upgrade pip
        pythonExec -m pip install -r requirements.txt
    fi
else
    # env is not activated, activate it
    echo "run following command to activate the environment:"
    echo '$' source $envFolder/bin/activate
    echo "then run this script again."
fi





