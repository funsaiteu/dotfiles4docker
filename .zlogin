## Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 &>/dev/null )
}

# pyenv
# It is almost certainly better to add it to your profile / login shell only, and not your rc.
# Turn USE_PYENV ON if you want to use it.
#USE_PYENV="OFF"
USE_PYENV="ON"
if [ $USE_PYENV = "ON" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  if _has pyenv; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
    source $PYENV_ROOT/completions/pyenv.zsh
  fi
fi
