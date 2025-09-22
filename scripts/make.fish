mise install erlang
mise use -g erlang@latest

# Define array of tools to install and use
set tools starship bat direnv flyctl elixir gleam elixir-ls fd go helix lazygit lsd prettier node yarn eza fzf

# Install all tools at once
mise install $tools

# Use latest version of all tools at once
for tool in $tools
    mise use -g $tool@latest
end

# install fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

ln  common/mise/config.toml $HOME/.config/mise/config.toml
ln  common/starship.toml $HOME/.config/starship.toml
ln  common/config.fish $HOME/.config/fish/config.fish
ln  common/zed.settings.json $HOME/.config/zed/settings.json
ln  common/code/keybindings.json $HOME/Library/Application\ Support/Cursor/User/keybindings.json
ln  common/code/settings.json $HOME/Library/Application\ Support/Cursor/User/settings.json
ln  common/ghostty/config $HOME/Library/Application\ Support/com.mitchellh.ghostty/config



fisher install jorgebucaran/autopair.fish patrickf1/fzf.fish jhillyerd/plugin-git halostatue/fish-elixir
