export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/kak
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/brave
export TERMINAL=/usr/bin/alacritty
export TERM=/usr/bin/alacritty
export PATH=$HOME/.local/bin:$PATH;
# 4k resolution
if [ $(hostname) = 'llipuru' ]; then
  export QT_SCREEN_SCALE_FACTORS=2 
fi 

setxkbmap -layout us,br
setxkbmap -option 'grp:alt_shift_toggle'
