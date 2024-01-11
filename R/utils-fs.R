dir_create <- function(path, call = rlang::caller_env()) {
  if (fs::dir_exists(path)) {
    cli::cli_abort(
      "Can't create {.path {path}} as it already exists.",
      call = call
    )
  }

  fs::dir_create(path)
}
