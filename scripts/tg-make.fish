set tg_tools go kubectl
mise install $tg_tools

for tool in $tg_tools
    mise use -g $tool@latest
end
