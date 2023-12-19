# set asdf completions
# source /opt/homebrew/opt/asdf/libexec/asdf.fish
# mkdir -p ~/.config/fish/completions; ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
if status is-interactive
    # Commands to run in interactive sessions can go here
    fish_add_path "$HOME/.cargo/bin"
    fish_add_path "$HOME/.local/bin"
    fish_add_path /opt/homebrew/Caskroom/google-cloud-sdk//latest/google-cloud-sdk/bin/
    export USE_GKE_GCLOUD_AUTH_PLUGIN=True
    export OPENAI_KEY="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"

    source /opt/homebrew/opt/asdf/libexec/asdf.fish
    alias updbdev="cloud_sql_proxy -instances=\"up-learn-v1:europe-west1:dev-db\"=tcp:localhost:8006"
    alias updbprod="cloud_sql_proxy -instances=\"up-learn-v1:europe-west1:prod\"=tcp:localhost:8007"
    alias upbashdev="kubectl -n staging exec -it deployment/up-learn-api bash"
    alias upbashprod="kubectl -n production exec -it deployment/up-learn-api bash"
    alias upclidev="kubectl -n staging exec -it deployment/up-learn-api bin/up_learn_api remote"
    alias upcliprod="kubectl -n production exec -it deployment/up-learn-api bin/up_learn_api remote"
    alias reload="source ~/.config/fish/config.fish"
    alias myip="dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com"

    alias sshv1="gcloud compute ssh v1-up-learn"
    alias ls=exa

    # Set up Homebrew
    eval (/opt/homebrew/bin/brew shellenv)

    # Set up thefuck
    thefuck --alias | source

    # Start shell with Starship
    starship init fish | source
end
