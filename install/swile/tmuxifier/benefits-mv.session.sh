# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/Workspace/swile/benefits"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "benefits-mv"; then
  new_window "server"
  new_window "editor"
  select_window 0
  run_cmd "bin/rails s"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
