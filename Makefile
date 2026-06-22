all:
  chsh -s $(which fish); \
  curl https://mise.run | sh; \
  fish ./scripts/make.fish; \
  curl -sS https://starship.rs/install.sh | sh 