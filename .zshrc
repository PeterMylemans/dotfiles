# ~/.zshrc: executed by zsh(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Alias definitions.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# if starship is installed, run the init script for bash
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi
