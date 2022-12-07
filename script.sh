#!/bin/sh

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
#       directory rotation
#
source $DIR/export_env.sh

SCRIPT_NAME="rotation_gitlab"
LOG_MENSAGENS="${SCRIPT_NAME}_script.log"
LOG_ERROS="${SCRIPT_NAME}_script.error.log"


# All normal and error messages will be redirected to the specified file
exec >$LOG_DIR/$LOG_MESSAGES 2>$LOG_DIR/$LOG_ERRORS

# Function to send notification by discord
sendMessage() {
  WEBHOOK_URL="https://your.webhook.discord.url"
  
  ## Add curl to discord (if you want, enter another json)
  curl -H 'Content-Type: application/json' -d "@notification_dump.json" $WEBHOOK_URL
}


#GitLab: backup job
echo "Directory rotation start in: $(date)"
echo "________________________________________________________________"


{
  if [[ -f "$BACKUP_DIR/dump_gitlab_backup.tar" ]]; then
      rm -rf $DIR002 
      mv $DIR001 $DIR002
      rm -rf $DIR001
      mkdir $DIR001
      cd $DIR001
      mv $BACKUP_DIR/*.tar .
      
  else
    sendMessage
  fi
} || {
  sendMessage

}

echo "________________________________________________________________" 
echo "End of rotation task in: $(date)"
