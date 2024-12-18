#!/bin/bash
set -e 

SCRIPT_DIR=$(dirname "$(realpath $0)")
PROJ_DIR=${SCRIPT_DIR}/../..

### ================== System Setups ======================
## Install System Dependencies
apt -y update
apt -y upgrade
apt -y install coreutils wget vim git
apt -y install gcc-11 g++-11 make cmake 
apt -y install clang-format 
apt -y install libboost-dev libboost-program-options-dev
apt -y install python3.12 python3-pip python3-venv
apt -y install libprotobuf-dev protobuf-compiler
apt -y install openmpi-bin openmpi-doc libopenmpi-dev

## Create Python venv: Required for Python 3.12
python3 -m venv ${PROJ_DIR}/.astra_sim_env
source ${PROJ_DIR}/.astra_sim_env/bin/activate

pip3 install --upgrade pip

## Install Python protobuf package
pip3 install protobuf==5.28.2

### ============= Install Chakra ==================
cd ${PROJ_DIR}/extern/graph_frontend/chakra
pip3 install .

### ======================================================