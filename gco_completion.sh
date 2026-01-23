_fzf_complete_gco() {
  _fzf_complete --preview 'git branch -v' -- "$@" < <(git branch -l | sed 's/^\*//')
}

_fzf_complete_gco_post() {
  local selected_branch="$1"
  #More robust branch extraction handling potential leading/trailing whitespace and *
  selected_branch=$(echo "$selected_branch" | sed 's/^[[:space:]]*\*//;s/[[:space:]]*$//')

  echo "DEBUG: Selected branch (post): '$selected_branch'" >&2
  if [[ -n "$selected_branch" ]]; then
    git checkout "$selected_branch"
    echo "$selected_branch"  # Return value for fzf
  else
    echo "Error: Empty branch name selected." >&2
  fi
}

[ -n "$BASH" ] && complete -F _fzf_complete_gco -o default -o bashdefault gco

