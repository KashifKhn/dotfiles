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
alias activate-python="source ~/.venv/bin/activate"
alias ls=lsd
alias vi=nvim
alias dc=docker-compose
alias pdf=evince
alias vi-learn="NVIM_APPNAME=learn-nvim-lua vi"
alias tmf="tmuxifier"


# Custom function aliases
mv-spring() {
  if [ "$1" = "run" ]; then
    ./mvnw spring-boot:run
  else
    echo "Unknown command: $1"
  fi
}

fix-hp() {
    systemctl --user restart pipewire wireplumber pipewire-pulse
    # if pgrep chrome > /dev/null; then
    #     pkill chrome
    #     google-chrome-stable --enable-features=WebRTCPipeWireCapturer &
    # elif pgrep chromium > /dev/null; then
    #     pkill chromium
    #     chromium --enable-features=WebRTCPipeWireCapturer &
    # else
    #     echo "Chrome/Chromium is not running."
    # fi
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
    filename="${2%.*}"
    javac "$2"
    if [ $? -eq 0 ]; then
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

# Function to set up and run Python environment
function run_python_env() {
  if [[ -d .venv ]]; then
    echo "Activating virtual environment..."
    source ./.venv/bin/activate
  else
    echo "No .venv found. Creating one..."
    python -m venv .venv
    source ./.venv/bin/activate
    echo "Virtual environment created and activated."
  fi

  python_version=$(python --version | awk '{print $2}')
  echo "Using Python version: $python_version"

  if [[ -f app.py ]]; then
    echo "app.py Existes"
  else
    echo "app.py not found. Creating a default app.py..."
    echo 'print("Hello, World!")' > app.py
    echo "Default app.py created with 'print(\"Hello, World!\")'."
    python app.py
  fi

  if [[ ! -f pyrightconfig.json ]]; then
    echo "pyrightconfig.json not found. Creating a default one..."
    cat <<EOL > pyrightconfig.json
{
  "venvPath": "./",
  "venv": ".venv",
  "pythonVersion": "$python_version",
  "pythonPlatform": "Linux",
  "include": [
        "./**/*.py"
    ],
  "exclude": [
        "node_modules",
        ".git"
    ]
}
EOL
    echo "pyrightconfig.json created with Python version $python_version."
  fi
}

alias runenv='run_python_env'


speedy() {
  if ! tmux has-session -t speedy-n 2>/dev/null; then
    tmuxifier load-session speedy-n
  fi

  tmux detach

  if ! tmux has-session -t speedy-be 2>/dev/null; then
    tmuxifier load-session speedy-be
  fi

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

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# Turso
export PATH="$PATH:/home/zarqan-khn/.turso"
export PATH="$HOME/.local/bin:$PATH"



# flutter
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
unset ANDROID_SDK_ROOT
export PATH="/opt/flutter/bin/cache/dart-sdk/bin:$PATH"


setopt nocorrect
