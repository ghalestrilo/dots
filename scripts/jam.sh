#!/bin/bash

folder="$1"

jamname=$(date "+%y-%m-%d")

# Run a Tidal Jam
tmux new-session -s jam "cd $JAM_PATH ;  zsh -c \"nvim include/${jamname}.tidal\""  \; \
  new-window sclang                                                               \; \
  new-window 'cninjam 143.110.158.146:2049 -user anonymous:ghales -jack'          \; \
  new-window 'ghci -ghci-script $TIDAL_BOOT_PATH'                                 \; \
  new-window 'cd ~/soundfonts && fluidsynth "$HOME/soundfonts/Chrono Trigger.sf2" --connect-jack-outputs' \; \
  select-window -t 0


#  new-window 'fluidsynth \"~/Chrono Trigger.sf2\"'                       \; \