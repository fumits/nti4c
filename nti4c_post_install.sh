#!/bin/bash

apt install git curl vim-gnome -y

# setup vim /w clipboard
touch .vimrc
cat <<EOF> .vimrc
set clipboard=unnamedplus
EOF

# setup FSL
touch .bash_profile
cat <<EOF> .bash_profile
FSLDIR=/usr/local/fsl
. ${FSLDIR}/etc/fslconf/fsl.sh
PATH=${FSLDIR}/bin:${PATH}
export FSLDIR PATH
EOF

# setup FreeSurfer 6.0.1
cat <<EOF>> .bashrc
export FREESURFER_HOME=/usr/local/freesurfer/6.0.1
source ${FREESURFER_HOME}/SetUpFreeSurfer.sh

