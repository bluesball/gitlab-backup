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
#       create dump skipping builds and artifacts
#
source $DIR/check_root.sh
source $DIR/export_env.sh

SCRIPT_NAME="dump_gitlab"

LOG_MENSAGENS="${SCRIPT_NAME}_script.log"
LOG_ERROS="${SCRIPT_NAME}_script.error.log"

# All normal and error messages will be redirected to the specified file
exec >$LOG_DIR/$LOG_MENSAGENS 2>$LOG_DIR/$LOG_ERROS

# Function to send notification by discord
sendMessage() {
  WEBHOOK_URL="https://your.webhook.discord.url"
  
  ## Add curl to discord
  curl -H 'Content-Type: application/json' -d "@notification_dump.json" $WEBHOOK_URL
}


echo "Create dump files in: $(date)"
echo "________________________________________________________________"

{
  if [[ -f "$BACKUP_DIR/dump_gitlab_backup.tar" ]]; then
      rm -rf "$BACKUP_DIR/*.tar"
      gitlab-backup create SKIP=builds,artifacts BACKUP=$ARQUIVO_DUMP
      gitlab-ctl backup-etc -p $BACKUP_DIR  
  else
    gitlab-backup create SKIP=builds,artifacts BACKUP=$ARQUIVO_DUMP
    gitlab-ctl backup-etc -p $BACKUP_DIR
  fi
} || {
  sendMessage
}

echo "________________________________________________________________"
echo "End of dump task in: $(date)"
