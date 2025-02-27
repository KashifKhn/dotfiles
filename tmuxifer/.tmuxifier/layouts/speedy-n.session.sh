# Expo (React Native) 
session_root "$HOME/mycoding/speedy-slotz/speedySlotz-native/"

if initialize_session "speedy-n"; then
  new_window "nvim"

  new_window "command"

  new_window "samsn-usr"
  run_cmd "npx expo start"

  new_window "vivo-pro"
  run_cmd "npx expo start --port 8082"

  select_window 1
fi

finalize_and_go_to_session
