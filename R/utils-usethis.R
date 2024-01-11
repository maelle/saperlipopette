create_project <- function(path) {
  rlang::with_options(
    usethis.quiet = getOption("usethis.quiet") %||% FALSE,
    usethis::create_project(path)
  )
}
