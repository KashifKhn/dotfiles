session_root "cd $HOME/mycoding/speedy-slotz/speedyslotz-web/"
if initialize_session "speedy-web"; then

  new_window "nvim"

  new_window "command"

  new_window "dev"
  run_cmd "pnpm dev"

  select_window 1
fi

finalize_and_go_to_session

