# set asdf completions
# source /opt/homebrew/opt/asdf/libexec/asdf.fish
# mkdir -p ~/.config/fish/completions; ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/gcloud/application_default_credentials.json
if status is-interactive
    # Commands to run in interactive sessions can go here
    source /opt/homebrew/opt/asdf/libexec/asdf.fish
    fish_add_path "$HOME/.cargo/bin"
    fish_add_path "$HOME/.local/bin"
    # fish_add_path /opt/homebrew/Caskroom/google-cloud-sdk//latest/google-cloud-sdk/bin/
    export USE_GKE_GCLOUD_AUTH_PLUGIN=True
    export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/gcloud/application_default_credentials.json

    source ~/git/dots/common/fly.fish

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
    alias ls="eza --long --header --icons --git"
    alias lss=eza

    # Set up Homebrew
    eval (/opt/homebrew/bin/brew shellenv)

    # Start shell with Starship
    eval "$(mise activate --shims fish)" 
    starship init fish | source

    fish_add_path "$HOME/.gem/bin"
end