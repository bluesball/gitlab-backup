#!/bin/bash

# ============================================================================ #
#                          G I T L A B  -  B A C K U P
# ============================================================================ #
#  Author: Joao Paulo
#  Date: 07/12/2022
#
#  https://bluesball.github.io
#  https://github.com/bluesball
#  https://www.linkedin.com/in/joaopauloscosta/
#
#
#       verify the root user (need translation)
#
source $DIR/export_env.sh

COR_AMARELO='\e[0;33m'
COR_DEFAULT='\e[0m'
COR_VERMELHO_NGR='\e[1;31m'

MENSAGEM=$(
  cat <<-msg
	[$(date)]
        ${COR_AMARELO}Please run this script with
        user ${COR_VERMELHO_NGR}'root'${COR_AMARELO} and
	no '$USER',
        because it is more convenient at this time!
        ${COR_DEFAULT}
msg
)

# Preventing the script from being executed with the wrong user
if [[ $USER != 'root' ]]; then
  echo -e $MENSAGEM
  exit 1
fi

if [[ ! -d "$LOG_DIR"   ]]; then
  mkdir -p "$LOG_DIR"
fi
