#' "Hey I'd like to find which commit introduced a bug!"
#'
#' @description
#' I notice a bug in my codebase.
#' I can see the bug was not there a bunch of commits ago.
#' Beside doing regular debugging, I can find out
#' which commit introduced the bug by using `git bisect`.
#' See <https://git-scm.com/docs/git-bisect>.
#'
#'
#' @inheritParams exo_one_small_change
#'
#' @section Git commands:
#' `git bisect`.
#' @return The path to the new project
#' @export
#'
#' @examplesIf interactive()
#' parent_path <- withr::local_tempdir()
#' path <- exo_bisect(parent_path = parent_path)
exo_bisect <- function(parent_path) {

  path <- file.path(parent_path, "bisect")

  withr::local_options(usethis.quiet = TRUE)

  dir_create(path)
  original_dir <- getwd()

  withr::local_dir(path)
  gert::git_init()

  file.copy(
    system.file("exo_bisect-Rprofile.R", package = "saperlipopette"),
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

  create_commit <- function(i, new_script) {
    script_lines <- brio::read_lines(new_script)
    if (i == 13) {
      new_line <- "aaaaaaaaah"
    } else {
      new_line <- sprintf("1+%s", i)
    }
    brio::write_lines(text = c(script_lines, new_line), path = new_script)
    gert::git_add(new_script)
    git_commit("feat: edit script")
  }

  purrr::walk(1:100, create_commit, new_script = new_script)

  usethis::local_project(original_dir, force = TRUE)

  cli::cli_alert_info("Follow along in {path}!")

  return(path)
}
