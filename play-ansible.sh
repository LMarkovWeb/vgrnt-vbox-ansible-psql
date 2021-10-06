#!/bin/bash
THIS=`readlink -f "${BASH_SOURCE[0]}"`
DIR=`dirname "${THIS}"`

cd $DIR
VENVDIR=venv
virtualenv --python=/usr/bin/python3 $VENVDIR
source $VENVDIR/bin/activate
pip install --upgrade -r data/requirements.txt

[[ " $@ " =~ " --vagrant " ]] && SERV="--extra-vars \"host=test_server\""

ansible-playbook install.yml $SERV