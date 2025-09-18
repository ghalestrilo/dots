# set asdf completions
# source /opt/homebrew/opt/asdf/libexec/asdf.fish
# mkdir -p ~/.config/fish/completions; ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/gcloud/application_default_credentials.json
if status is-interactive
    # Commands to run in interactive sessions can go here
    # source /opt/homebrew/opt/asdf/libexec/asdf.fish
    fish_add_path "$HOME/.cargo/bin"
    fish_add_path "$HOME/.local/bin"
    # fish_add_path /opt/homebrew/Caskroom/google-cloud-sdk//latest/google-cloud-sdk/bin/
    export USE_GKE_GCLOUD_AUTH_PLUGIN=True
    export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/gcloud/application_default_credentials.json

    source ~/git/dots/common/fly.fish

    if [ -d ~/git/bend ]
        echo "Bend directory found. Importing bend-aliases.fish"
        source ~/git/dots/scripts/bend-aliases.fish
    end

    alias vault="cd /Users/ghales/Library/CloudStorage/GoogleDrive-ghalestrilo@gmail.com/My\ Drive/me/docs/main"
    alias reload="source ~/.config/fish/config.fish"
    alias theme="kitty +kitten themes"

    # Elixir commands
    alias mf="mix test --failed --trace"
    alias mdg="mix deps.get"
    alias mdc="mix deps.compile"
    alias mps="mix phx.server"
    alias mt="mix test"
    alias mts="mix test --stale"
    alias ips="iex -S mix phx.server"
    alias wget="http --download"
    alias lss=ls
    alias ls="eza --long --header --icons --git"
    alias glom="git pull origin main --no-rebase"

    alias ghostty-config="$EDITOR $HOME/Library/Application\ Support/com.mitchellh.ghostty/config"

    # Set up Homebrew
    # eval (/opt/homebrew/bin/brew shellenv)

    # Hook programs
    eval "$(mise activate --shims fish)"
    starship init fish | source
    direnv hook fish | source

    # Additional scripts
    fish_add_path "$HOME/.gem/bin"
    fish_add_path "$HOME/go/bin"
end
