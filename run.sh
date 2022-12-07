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
#       this is the file to run: ./run.sh
#
export DIR="$(dirname "${BASH_SOURCE[0]}")"
source $DIR/check_root.sh
source $DIR/check_dir.sh
source $DIR/dump_gitlab.sh
source $DIR/script.sh
