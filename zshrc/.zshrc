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
ZSH_THEME="robbyrussell"
# ZSH_THEME="powerlevel10k/powerlevel10k"
# eval "$(starship init zsh)"  # Commenting out Starship as well


# New line command
OMZ_NEW_LINE_FORMAT=$'\n ➜ '
ZSH_THEME_GIT_PROMPT_SUFFIX+=$OMZ_NEW_LINE_FORMAT

# Uncomment if you want to move the command line to a new line always 
PROMPT+=$OMZ_NEW_LINE_FORMAT

# Export necessary environment variables for dark theme
export QT_QPA_PLATFORMTHEME=qt5ct
export GTK_THEME=Adwaita-dark

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Plugins to load (keeping it simple)
plugins=(git zsh-autosuggestions fast-syntax-highlighting fzf )

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
alias vi-learn="NVIM_APPNAME=learn-nvim-lua vi"


# Custom function aliases
mv-spring() {
  if [ "$1" = "run" ]; then
    ./mvnw spring-boot:run
  else
    echo "Unknown command: $1"
  fi
}

crun() {
  if [ "$1" = "run" ]; then
    if [ -z "$2" ]; then
      echo "Error: No source file provided."
      return 1
    fi

    if [ ! -f "$2" ]; then
      echo "Error: Source file '$2' not found."
      return 1
    fi

    filename="${2%.*}"

    gcc "$2" -o "$filename"
    
    if [ $? -eq 0 ]; then
      ./"$filename"
    else
      echo "Compilation failed."
    fi
  else
    echo "Unknown command: $1"
  fi
}


javarun() {
  if [ "$1" = "run" ]; then
    if [ -z "$2" ]; then
      echo "Error: No source file provided."
      return 1
    fi

    if [ ! -f "$2" ]; then
      echo "Error: Source file '$2' not found."
      return 1
    fi

    # Extract the filename without extension
    filename="${2%.*}"

    # Compile the Java file
    javac "$2"
    
    # Check if compilation was successful
    if [ $? -eq 0 ]; then
      # Run the compiled Java class using 'java' command
      java "$filename"
    else
      echo "Compilation failed."
    fi
  else
    echo "Unknown command: $1"
  fi
}

remove_chrome_lock() {
  rm -rf ~/.config/google-chrome/SingletonLock;
  echo "Removed Chrome SingletonLock"
}


# fzf find folder to ctrl f and ctrl shif f
autoload -Uz add-zsh-hook
add-zsh-hook precmd fzf_keybinds
fzf_keybinds() {
  zle -N fzf_cd_home
  zle -N fzf_cd_current
  bindkey '^F' fzf_cd_home
  bindkey '\e[1;6F' fzf_cd_current
}
fzf_cd_home() {
  local dir
  dir=$(fd --type d --hidden --exclude .git --exclude node_modules . "$HOME" | fzf) || return
  cd "$dir" || return
  zle reset-prompt
}
fzf_cd_current() {
  local dir
  dir=$(fd --type d --hidden --exclude .git --exclude node_modules . . | fzf) || return
  cd "$dir" || return
  zle reset-prompt
}

# autoload -Uz add-zsh-hook
#
# fzf_keybinds() {
#   zle -N fzf_cd_home
#   zle -N fzf_cd_current
#   zle -N fzf_cd_tmux
#   bindkey '^F' fzf_cd_home
#   bindkey '^[^F' fzf_cd_current
#   bindkey '^[^@^F' fzf_cd_tmux
# }
#
# fzf_cd_home() {
#   local dir
#   dir=$(fd --type d --hidden --exclude .git --exclude node_modules . "$HOME" 2>/dev/null | fzf) || return
#   open_in_tmux "$dir"
# }
#
# fzf_cd_current() {
#   local dir
#   dir=$(fd --type d --hidden --exclude .git --exclude node_modules . . 2>/dev/null | fzf) || return
#   open_in_tmux "$dir"
# }
#
# fzf_cd_tmux() {
#   local dir session_name
#   dir=$(fd --type d --hidden --exclude .git --exclude node_modules . "$HOME" 2>/dev/null | fzf) || return
#   session_name=$(basename "$dir" | tr -d '[:space:]')
#   tmux new-session -A -s "$session_name" -c "$dir"
#   tmux switch-client -t "$session_name"
# }
#
# open_in_tmux() {
#   local dir=$1
#   if [[ -n $TMUX ]]; then
#     tmux new-window -c "$dir" -n "$(basename "$dir")"
#   else
#     tmux new-session -A -s "$(basename "$dir")" -c "$dir"
#   fi
# }
#
# fzf_keybinds
#


# Fuzzy search setup
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Export for faster fuzzy finders and completion
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# History settings for faster recalling of commands
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

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

# vscode-json-lsp
export PATH="$PATH:$HOME/.local/share/pnpm"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "/home/zarqan-khn/.deno/env"

export "JAVA_HOME=/usr/lib/jvm/java-21-openjdk"
export "PATH=$JAVA_HOME/bin:$PATH"

# removing non-existent directories for PATH
export PATH=$(echo $PATH | tr ':' '\n' | awk '{if(system("[ -d " $0 " ]") == 0) print $0}' | paste -sd ':' -)

# go path
# export PATH="~/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

export YAY_CACHE_DIR="/home/zarqan-khn/.cache/yay"
export BUILDDIR="/home/zarqan-khn/.build"


export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"
