#' "Oh shit, I need to undo a commit from like 5 commits ago!"
#'
#' @description
#' To go with <https://ohshitgit.com/#undo-a-commit>
#'
#'
#' @inheritParams exo_one_small_change
#' @section Git commands:
#' `git log`, `git revert`
#'
#' @return The path to the new project
#' @export
#'
#' @examplesIf interactive()
#' parent_path <- withr::local_tempdir()
#' path <- exo_undo_commit(parent_path = parent_path)
exo_undo_commit <- function(parent_path) {

  path <- file.path(parent_path, "undo-commit")

  withr::local_options(usethis.quiet = TRUE)

  dir_create(path)
  original_dir <- getwd()

  withr::local_dir(path)
  gert::git_init()

  file.copy(
    system.file("exo_undo_commit-Rprofile.R", package = "saperlipopette"),
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

  brio::write_lines("lala", "fix.txt")
  gert::git_add("fix.txt")
  git_commit("fix: fix things")

  fs::file_create("bla")
  brio::write_lines(
    text = c("thing 1", "thing 2"),
    path = "bla"
  )
  gert::git_add("bla")
  git_commit("feat: add bla")
  brio::write_lines(
    text = c("thing 1", "thing 3"),
    path = "bla"
  )
  gert::git_add("bla")
  git_commit("fix: edit bla")
  brio::write_lines(
    text = c("thing 3", "thing 3"),
    path = "bla"
  )
  gert::git_add("bla")
  git_commit("fix: amend bla")



  usethis::local_project(original_dir, force = TRUE)

  cli::cli_alert_info("Follow along in {path}!")

  return(path)
}
