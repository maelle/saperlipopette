#' "Hey I'd like to remove these untracked files I created to test stuff!"
#'
#' @description
#' If debugging for instance created now useless untracked files and directories,
#' there's no need to remove them "manually".
#' The tool for that is `git clean`:
#' - `git clean -n` for a dry run;
#' - `git clean -f` to run it;
#' Add `-d` to also remove directories.
#' See <https://git-scm.com/docs/git-clean>.
#'
#'
#' @inheritParams exo_one_small_change
#'
#' @section Git commands:
#' `git clean`.
#' @return The path to the new project
#' @export
#'
#' @examplesIf interactive()
#' parent_path <- withr::local_tempdir()
#' path <- exo_clean_dir(parent_path = parent_path)
exo_clean_dir <- function(parent_path) {

  path <- file.path(parent_path, "clean-dir")

  withr::local_options(usethis.quiet = TRUE)

  dir_create(path)
  original_dir <- getwd()

  withr::local_dir(path)
  gert::git_init()

  file.copy(
    system.file("exo_clean_dir-Rprofile.R", package = "saperlipopette"),
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

  new_script <- file.path("R", "script.R")
  fs::file_create(new_script)
  script_lines <- c("a <- 1", "b <- 2")
  brio::write_lines(text = script_lines, path = new_script)
  gert::git_add(new_script)
  git_commit("feat: add script")

  fs::dir_create("debugging")
  fs::file_create("debug1")
  fs::file_create("debug2")
  fs::file_create("debug3")
  fs::file_create("debug4")

  usethis::local_project(original_dir, force = TRUE)

  cli::cli_alert_info("Follow along in {path}!")

  return(path)
}
