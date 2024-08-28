#!/bin/bash

REPO_URL="https://github.com/KashifKhn/dotfiles.git"

DOTFILES_DIR="$HOME/dotfiles"

software_list=("stow" "nvim" "tmux" "zsh")

check_install() {
  if ! command -v "$1" &>/dev/null; then
    echo "$1 is not installed. Installing..."
    sudo apt-get update
    sudo apt-get install -y "$1"
  else
    echo "$1 is already installed."
  fi
}

if [ ! -d "$DOTFILES_DIR" ]; then
  echo "Cloning dotfiles repository..."
  git clone "$REPO_URL" "$DOTFILES_DIR"
else
  echo "Dotfiles repository already exists."
fi

for software in "${software_list[@]}"; do
  check_install "$software"
done

cd "$DOTFILES_DIR" || exit
for dir in .* */; do
  if [ "$dir" != "." ] && [ "$dir" != ".." ]; then
    stow -v "$dir"
  fi
done

if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Switching default shell to Zsh..."
  chsh -s "$(which zsh)"
  echo "Default shell changed to Zsh. Please log out and log back in for the change to take effect."
else
  echo "You are already using Zsh as your default shell."
fi

echo "Dotfiles have been stowed successfully."
