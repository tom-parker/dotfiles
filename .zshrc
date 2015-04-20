export LC_ALL=en_GB.UTF-8
export ZSH=$HOME/.oh-my-zsh

# Theme
export ZSH_THEME="prose"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git tmuxinator)
alias mux=tmuxinator

source $ZSH/oh-my-zsh.sh

# Setup path
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/usr/local/git/bin:/$HOME/dev/arcanist/arcanist/bin

# Source extras
for file in ~/.{aliases,functions,exports,extras}; do
        [ -r "$file" ] && source "$file"
done
unset file

# tmux
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# z
. `brew --prefix`/etc/profile.d/z.sh

#git completition
source ~/bin/.git-completion.sh
