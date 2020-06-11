# Setup fzf
# ---------
if [[ ! "$PATH" == */home/soip/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/soip/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/soip/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/soip/.fzf/shell/key-bindings.bash"
