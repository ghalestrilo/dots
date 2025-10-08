# Common fish functions

echo "hi"

function piprun
    set -l user_base (python3 -m site --user-base)
    set -l command "$user_base/bin/$argv[1]"

    if test -f "$command"
        eval "$command" $argv[2..]
    else
        echo "Error: Command '$argv[1]' not found in $user_base/bin/"
        return 1
    end
end
