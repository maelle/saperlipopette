#' "Hey I'd like to split these changes to the same file in several commits!"
#'
#' @description
#' I made many edits to a file, in different places.
#' This is too much for a commit, since small commits are best practice.
#' I need to add the changes to Git bit by bit.
#' The tool for that is `git add --patch`, also available as `git add -p`.
#' If all your changes are presented to you as one chunk by `git add --patch`,
#' choose the "s" option for splitting.
#' See <https://git-scm.com/book/en/v2/Git-Tools-Interactive-Staging#_staging_patches>.
#'
#' Note that patch is also an option for `git commit`, if you prefer so.
#'
#'
#' @inheritParams exo_one_small_change
#'
#' @section Git commands:
#' `git add --patch`, `git add -p`.
#' @return The path to the new project
#' @export
#'
#' @examplesIf interactive()
#' parent_path <- withr::local_tempdir()
#' path <- exo_split_changes(parent_path = parent_path)
exo_split_changes <- function(parent_path) {

  path <- file.path(parent_path, "split-changes")

  withr::local_options(usethis.quiet = TRUE)

  fs::dir_create(path)
  original_dir <- getwd()

  withr::local_dir(path)
  gert::git_init()

  file.copy(
    system.file("exo_split_changes-Rprofile.R", package = "saperlipopette"),
    ".Rprofile"
  )

  usethis::create_project(path = getwd())
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

  script_lines <- append(script_lines, "# a comment", after = 0)
  script_lines <- append(script_lines, c("1/2", "1/3"), after = 2)
  script_lines <- append(script_lines, c("library(ggplot2)"))
  brio::write_lines(text = script_lines, path = new_script)

  usethis::local_project(original_dir, force = TRUE)

  cli::cli_alert_info("Follow along in {path}!")

  return(path)
}
