# ==== P10K Stuff ====
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme


# Use powerline
USE_POWERLINE="true"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# ==== Functions ==== 
function bwu() {
    BW_STATUS=$(bw status | jq -r .status)
    case "$BW_STATUS" in
    "unauthenticated")
        echo "Logging into BitWarden"
        export BW_SESSION=$(bw login --raw)
        ;;
    "locked")
        export BW_SESSION=$(bw unlock --raw)
        ;;
    "unlocked")
        echo "Vault is unlocked"
        ;;
    *)
        echo "Unknown Login Status: $BW_STATUS"
        return 1
        ;;
    esac
    bw sync
}

# ==== Variables ==== 
PATH=$PATH:~/bin/				# Append ~/bin to $PATH
export BAT_THEME="TwoDark"		# Theme for bat
export EDITOR=nvim
export PAGER=bat
export COREDUMP="/var/lib/systemd/coredump"
#export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python	# Cache for python
export LC_ALL="en_US.UTF-8"

# ==== Aliases ====
alias r="echo > /dev/null"
alias ls=lsd
alias py=python
alias rr=ranger
alias df="df -h"
alias wttr="curl wttr.in"
alias map="npx mapscii"
alias bt="bluetooth toggle"
# Creates bare git repo at remote ssh server
alias pigcr='(){if [ -z $1 ]; then echo "Please provide a name for the repository!"; else ssh coffeepie -t "git init --bare /mnt/drive_ext/Git/$1.git"; fi;}'

alias virsh-list="virsh --connect qemu:///system list --all"
alias virtmachine="nohup virt-manager --connect qemu:///system --show-domain-console "
alias kvmstart='(){virsh --connect qemu:///system start $1 & virt-manager --connect qemu:///system --show-domain-console $1}'

alias pandoc="docker run --rm --volume '`pwd`:/data' pandoc/core"

alias tmpv='(){mpv --profile=sw-fast --vo=kitty --vo-kitty-use-shm=yes --terminal --hwdec=auto $1}'

# --- yt-dlp ---
alias ytbv="yt-dlp -f \"bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best\""
alias ytba="yt-dlp -f \"bestaudio[ext=m4a]\""
alias ytbvpl="yt-dlp -f \"bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best\" -o \"%(playlist_index)s %(fulltitle)s [%(id)s].%(ext)s\""
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

