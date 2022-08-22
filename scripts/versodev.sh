#!/bin/bash

folder="$HOME/git/verso"

# Run a Tidal Jam
tmux new-session -s uplearn \; \
  new-window "cd $folder && yarn start"  \; \
  new-window "cd $folder && yarn run backend"