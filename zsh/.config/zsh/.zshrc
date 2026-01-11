#!/bin/sh

# --- Options ---
HISTFILE=~/.zsh_history
setopt appendhistory autocd extendedglob nomatch menucomplete interactive_comments
stty stop undef 
#stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')
unsetopt BEEP

# --- Completion System (Optimized with Cache) ---
autoload -Uz compinit
# Check if .zcompdump exists and is less than 24 hours old.
# If so, skip the slow security checks.
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

# --- Key Bindings (History Search) ---
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^p" up-line-or-beginning-search 
bindkey "^n" down-line-or-beginning-search
bindkey "^k" up-line-or-beginning-search 
bindkey "^j" down-line-or-beginning-search

# --- Load Configs ---
# Source the manual plugin manager first
source "$ZDOTDIR/zsh-functions"
source <(curl -sL init.zshell.dev); zzinit 

# Load exports (PATHs, Env Vars)
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-vim-mode"
# Note: Removed "zsh-prompt" because you are using Starship.

# --- Plugins ---
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "unixorn/fzf-zsh-plugin"
zsh_add_plugin "MichaelAquilina/zsh-you-should-use"

# --- Tool Initializations (The "Eval" Block) ---
# Initialize these only if the commands exist to avoid errors
command -v rbenv >/dev/null && eval "$(rbenv init -)"
command -v pyenv >/dev/null && eval "$(pyenv init -)"
command -v fnm   >/dev/null && eval "$(fnm env --use-on-cd)"
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
command -v atuin >/dev/null  && eval "$(atuin init zsh)"
command -v starship >/dev/null && eval "$(starship init zsh)"

# --- Custom Key Bindings ---
bindkey -s '^o' 'y^M'          # Yazi
bindkey -s '^g' 'zi^M'         # Zoxide interactive
bindkey -s '^s' 'ncdu^M'       # Disk usage
bindkey -s '^f' 'nvim $(fzf)^M' # Open file in nvim
bindkey -s '^v' 'nvim\n'       # Open nvim
# Your Todo list binding
bindkey -s '^[t' 'nvim $TODO_LOG^M' 

bindkey '^ ' autosuggest-accept
bindkey '^[[P' delete-char


bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
