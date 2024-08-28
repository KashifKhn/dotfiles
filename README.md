# Dotfiles Setup

This repository contains scripts to set up your development environment on Unix-like systems (Linux, macOS, etc.) Tested on Ubuntu. The setup includes stowing your dotfiles and installing necessary software.

## Installation

### 1. Basic Dotfiles Installation

To clone the repository and stow the dotfiles:

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/KashifKhn/dotfiles.git ~/dotfiles
   ```

2. **Make the Script Executable**:

   ```bash
   chmod +x ~/dotfiles/install_dotfile.sh
   ```

3. **Run the Script**:
   ````
   ```bash~/dotfiles/install_dotfile.sh`
   ```
   ```
   ````

This script will:

- Clone the dotfiles repository into your home directory.
- Ensure `stow`, `zsh`, `nvim`, and `tmux` are installed.
- Stow the dotfiles, applying your configurations.

### 2. Full Setup

For a complete setup that includes installing essential tools and fonts:

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/KashifKhn/dotfiles.git ~/dotfiles
   ```

2. **Make the Script Executable**:

   ```bash
   chmod +x ~/dotfiles/setup_environment.sh
   ```

3. **Run the Script**:
   ```bash
   ~/dotfiles/setup_environment.sh
   ```

This script will:

- Install essential software (`git`, `zsh`, `stow`, `nvim`, `lazygit`, `fzf`, `ripgrep`, `fd-find`).
- Install Oh My Zsh and Powerlevel10k.
- Download and install the JetBrains Mono Nerd Font.
- Stow your dotfiles.
- Switch your default shell to Zsh.

## Requirements

- Unix-like operating system (Linux, macOS, etc.)
- Tested on Ubuntu
- Internet connection for downloading packages and fonts.

## Usage

After running the desired script, your environment will be set up according to your dotfiles and preferences.

For the basic installation, use `install_dotfile.sh`.
For a full environment setup, use `setup_environment.sh`.
