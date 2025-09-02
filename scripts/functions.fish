# This function is called `not`. it receives one argument and `cd`s into the `~/git/notabc` subfolder of the same name
function cdnot
    cd ~/git/notabc/$argv
end

# fly.io
function flyremote
    TERM=xterm fly ssh console --pty -C "/app/bin/$argv[1] remote" -a $argv[2]
end