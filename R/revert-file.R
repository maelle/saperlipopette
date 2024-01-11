#' "Oh shit, I need to undo my changes to a file!"
#'
#' @description
#' To go with <https://ohshitgit.com/#undo-a-file>
#'
#'
#' @inheritParams exo_one_small_change
#' @section Git commands:
#' `git log`, `git checkout`, `git commit`
#'
#' @return The path to the new project
#' @export
#'
#' @examplesIf interactive()
#' parent_path <- withr::local_tempdir()
#' path <- exo_revert_file(parent_path = parent_path)
exo_revert_file <- function(parent_path) {

  path <- file.path(parent_path, "revert-file")

  withr::local_options(usethis.quiet = TRUE)

  dir_create(path)
  original_dir <- getwd()

  withr::local_dir(path)
  gert::git_init()

  file.copy(
    system.file("exo_revert_file-Rprofile.R", package = "saperlipopette"),
    ".Rprofile"
  )

  create_project(path = getwd())
  # Ignore Rproj that might otherwise get edited when we open the project
  rproj <- fs::dir_ls(glob = "*.Rproj")
  usethis::local_project(getwd(), force = TRUE)
  usethis::use_git_ignore(rproj)
  usethis::use_git_ignore(".Rprofile")
  gert::git_add("*")
  git_commit("First commit")

  fs::file_create("bla.txt")
  brio::write_lines(
    text = c("thing 1", "thing 2"),
    path = "bla.txt"
  )
  gert::git_add("bla.txt")
  git_commit("feat: add bla.txt")
  brio::write_lines(
    text = c("thing 1", "thing 3"),
    path = "bla.txt"
  )
  gert::git_add("bla.txt")
  git_commit("fix: edit bla")
  brio::write_lines(
    text = c("thing 3", "thing 3"),
    path = "bla.txt"
  )
  gert::git_add("bla.txt")
  git_commit("fix: amend bla.txt")

  brio::write_lines("lala", "fix.txt")
  brio::write_lines("lala", "bla.txt")
  gert::git_add(c("bla.txt", "fix.txt"))
  git_commit("fix: fix things")

  usethis::local_project(original_dir, force = TRUE)

  cli::cli_alert_info("Follow along in {path}!")

  return(path)
}
