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
#       verify the directories witch be used
#
source $DIR/export_env.sh

COR_AMARELO='\e[0;33m'
COR_DEFAULT='\e[0m'
COR_VERMELHO_NGR='\e[1;31m'

MENSAGEM=$(
  cat <<-msg
        ${COR_AMARELO}Please run this script with
        user ${COR_VERMELHO_NGR}'ROOT'${COR_AMARELO},
        otherwise we will have errors!
        And you don't want to make mistakes, do you? ${COR_DEFAULT}
msg
)

# Preventing the script from being executed with the wrong user
if [[ $USER != 'root' ]]; then
  echo -e $MENSAGEM
  exit 1
fi

if [[ ! -d "$LOG_DIR" ]]; then
  mkdir -p "$LOG_DIR"
fi

if [[ ! -d "$DUMP_FILES_DIR" ]]; then
  mkdir -p "$DUMP_FILES_DIR"
fi

if [[ ! -d "$DIR001" ]]; then
  mkdir -p "$DIR001"
fi

if [[ ! -d "$DIR002" ]]; then
  mkdir -p "$DIR002"
fi
