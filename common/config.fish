if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path "$HOME/.cargo/bin"
    fish_add_path "~/.local/bin"
    starship init fish | source
end
