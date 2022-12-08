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
#       System environment variables (need translation)
#
export PG_COLOR=always
export DIR="$(dirname "${BASH_SOURCE[0]}")"
export LOG_DIR="$DIR/logs"

export BACKUP_DIR="/var/opt/gitlab/backups"
export DUMP_FILES_DIR="$DIR/dumpfiles"
export DIR001="$DUMP_FILES_DIR/001"
export DIR002="$DUMP_FILES_DIR/002"

export ARQUIVO_DUMP="$BACKUP_DIR/dump"
