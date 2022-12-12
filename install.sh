# install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# Install nix packages

nix-env -iA \
  nixpkgs.zsh \
  nixpkgs.fish \
  nixpkgs.starship \
  nixpkgs.antibody \
  nixpkgs.tmux \
  nixpkgs.stow \
  nixpkgs.fzf \
  nixpkgs.bat \
  nixpkgs.exa \
  nixpkgs.direnv \
  nixpkgs.ripgrep \
  nixpkgs.unzip \
  nixpkgs.git \
  nixpkgs.gh \
  nixpkgs.neovim \
  nixpkgs.yarn \
  nixpkgs.nodejs \
  

stow bash
stow fish
stow zsh
stow tmux
stow starship
stow emacs
stow baseDotFile

# add zsh and fish to valid login shells 
command -v fish | sudo tee -a /etc/shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as a default shells
sudo chsh -s $(which fish) $USER

# source antibody to zsh
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# tmux plugin manager tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Add global .gitignore
git config --global core.excludesfile ~/.gitignore
