# ==== P10K Stuff ====
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ==== Variables ==== 
PATH=$PATH:~/bin/				# Append ~/bin to $PATH
export BAT_THEME="TwoDark"		# Theme for bat
export EDITOR=nvim

# ==== Aliases ====
alias ls=lsd
alias py=python
alias rr=ranger
alias wttr="curl wttr.in"
alias map="npx mapscii"
# Creates bare git repo at remote ssh server
alias pigcr='(){if [ -z $1 ]; then echo "Please provide a name for the repository!"; else ssh pie -t "git init --bare /mnt/drive_ext/Git/$1.git"; fi;}'

alias virsh-list="virsh --connect qemu:///system list --all"
alias virtmachine="nohup virt-manager --connect qemu:///system --show-domain-console "

# --- yt-dlp ---
alias ytbv="yt-dlp -f \"bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best\""
alias ytba="yt-dlp -f \"bestaudio[ext=m4a]\""
alias ytbapl="yt-dlp -f \"bestaudio[ext=m4a]\" -o \"%(playlist_index)s %(fulltitle)s [%(id)s].%(ext)s\""

# --- amixer ---
alias am+="amixer sset Master 5%+"
alias am-="amixer sset Master 5%-"

# --- kde ---
alias kdelogout="qdbus org.kde.ksmserver /KSMServer logout 0 0 0"

# --- fzf ---
alias qs='(){echo "$(find $1 | fzf)"}'					# Quick search anything from path through fzf
alias qsd='(){echo $(find $1 -type d | fzf)}'			# Quick search directories from path through fzf
alias qsf='(){echo $(find $1 -type f | fzf)}'			# Quick search files from path through fzf

alias cdd='(){dir=$(find $1 -type d | fzf) ; cd "$dir"}'										# Cd into a directory from fzf

alias qvim='(){file=$(find $1 -type f | fzf) ; if [ ! -z $file ]; then vim "$file"; fi;}'		# Open a file in vim from fzf
alias qmpv='(){file=$(find $1 | fzf) ; if [ ! -z $file ]; then mpv "$file"; fi;}'				# Open a file or folder in mpv from fzf


# ==== Run on Start ====
# Custom script that does same as macchina
myfetch r  # r to random arts

