# Setup completions for mise
mise use -g usage
mise completion fish > ~/.config/fish/completions/mise.fish

# Setup erlang (required for installing elixir)
mise install erlang
mise use -g erlang@latest

mise install $tools

# Use latest version of all tools at once
for tool in $tools
    mise use -g $tool@latest
end

# install fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

ln  common/code/keybindings.json $HOME/Library/Application\ Support/Cursor/User/keybindings.json
ln  common/code/settings.json $HOME/Library/Application\ Support/Cursor/User/settings.json
ln  common/ghostty/config $HOME/Library/Application\ Support/com.mitchellh.ghostty/config

mkdir -p $HOME/.config/crush/
ln  common/crush.json $HOME/.config/crush/crush.json

# Link VSCodium configs - FIXME: don't link the folder like that, just settings and keybindings

if [ -d ~/git/tg ]
    echo "TG directory found. Importing tg-make.fish"
    source ~/git/dots/scripts/tg-make.fish
end
