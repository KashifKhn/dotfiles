session_root "$HOME/mycoding/speedy-slotz/speedyslotz-web"


if initialize_session "speedy-web"; then

  new_window "nvim"

  new_window "command"

  new_window "dev-server"
  run_cmd "npm run dev"

  select_window 1
fi

finalize_and_go_to_session

