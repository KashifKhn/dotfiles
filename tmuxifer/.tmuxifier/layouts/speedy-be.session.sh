session_root "$HOME/mycoding/speedy-slotz/speedyslotz-core-services/"

if initialize_session "speedy-be"; then
  new_window "nvim"

  new_window "command"

  new_window "spring"
  run_cmd "dc down && dc up -d && ./mvnw spring-boot:run"

  new_window "eureka server"
  run_cmd "cd $HOME/mycoding/speedy-slotz/eureka/ && ./mvnw spring-boot:run"

  select_window 1
fi

finalize_and_go_to_session
