# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/kube-staging"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "kube-staging"; then
  new_window "tunnel"
  new_window "pods"

  select_window 0
  run_cmd "tunnel-staging"

  select_window 1
  run_cmd "watch kubectl get pods --namespace=benefits"
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
