#!/bin/bash

##### SET FOLLOWING VARS #####
SERVER_ADDR="0.0.0.0"
SERVER_PORT=7869
CLONE_DIR="comfyui"
VENV_DIR="venv"
###### END OF VARIABLES ######

# set working dir to this script's location:
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $SCRIPT_DIR

# check if install dir already exists
if [ ! -d "$CLONE_DIR" ]; then
    echo "Cloning ComfyUI repo..."
    echo ""
    git clone https://github.com/comfyanonymous/ComfyUI.git $CLONE_DIR
fi

cd $CLONE_DIR
if [ ! -d "$VENV_DIR" ]; then
    echo ""
    echo "Setting up python virtual environment..."
    echo ""
    python3 -m venv venv
    source "${VENV_DIR}"/bin/activate
    "${VENV_DIR}"/bin/python -m pip install --upgrade pip
    "${VENV_DIR}"/bin/python -m pip install -r requirements.txt
    "${VENV_DIR}"/bin/python -m pip install xformers==0.0.27.post2
    "${VENV_DIR}"/bin/python -m pip install accelerate
    "${VENV_DIR}"/bin/python -m pip install insightface
    git clone https://github.com/ltdrdata/ComfyUI-Manager.git custom_nodes/ComfyUI-Manager
    git clone https://github.com/AIFSH/ComfyUI-Hallo.git custom_nodes/ComfyUI-Hallo
    "${VENV_DIR}"/bin/python -m pip install -r custom_nodes/ComfyUI-Hallo/requirements.txt
else
    source "${VENV_DIR}"/bin/activate
fi

$VENV_DIR/bin/python main.py --listen $SERVER_ADDR --port $SERVER_PORT --multi-user