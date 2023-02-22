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


PATH=$PATH:/home/hopkins/bin/
export BAT_THEME="TwoDark"

# Personal Aliases
alias py=python
alias q=exit
alias rr=ranger
alias ytbv="yt-dlp -f \"bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best\""
alias ytba="yt-dlp -f \"bestaudio[ext=m4a]\""
alias am+="amixer sset Master 5%+"
alias am-="amixer sset Master 5%-"
alias klog="qdbus org.kde.ksmserver /KSMServer logout 0 0 0"

#alias fh="cd \"$(find /home/hopkins -type d | fzf)\""
#alias fm=cd "$(find /mnt -type d | fzf)"


# Custom script that does same as macchina
#macchina
mfetch
