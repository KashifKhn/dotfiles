# Enable Powerlevel10k instant prompt (commented out)
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"

# Commented out Powerlevel10k theme and other themes for simplicity
# ZSH_THEME="powerlevel10k/powerlevel10k"
eval "$(starship init zsh)"  # Commenting out Starship as well

# Export necessary environment variables for dark theme
export QT_QPA_PLATFORMTHEME=qt5ct
export GTK_THEME=Adwaita-dark

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Plugins to load (keeping it simple)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

# User configuration
export EDITOR='nvim'

# Personal aliases
alias python="python3"
alias ls=lsd
alias vi=nvim
alias dc=docker-compose
alias pdf=evince

# Custom function aliases
spring() {
  if [ "$1" = "run" ]; then
    ./mvnw spring-boot:run
  else
    echo "Unknown command: $1"
  fi
}

# Path for console-ninja
PATH=~/.console-ninja/.bin:$PATH

# Bun completions
[ -s "/home/zarqan-khn/.bun/_bun" ] && source "/home/zarqan-khn/.bun/_bun"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# PNPM configuration
export PNPM_HOME="/home/zarqan-khn/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# XDG directories
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
