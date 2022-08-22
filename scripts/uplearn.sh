#!/bin/bash

folder="$HOME/git/uplearn"

# Run a Tidal Jam
tmux new-session -s uplearn \; \
  new-window "cd $folder/up-learn && docker-compose up api"  \; \
  new-window "cd $folder/up-learn-webapp && npm start"