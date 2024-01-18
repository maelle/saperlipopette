#' "Hey I'd like to see what merge conflicts look like!"
#'
#' @description
#' I made some work in a feature branch and want to merge it.
#' Meanwhile, the main branch advanced.
#' Unfortunately someone touched the same file as I did.
#' Now I need to fix a merge conflict!
#'
#' See also <https://happygitwithr.com/git-branches.html#dealing-with-conflicts>.
#'
#'
#' @inheritParams exo_one_small_change
#'
#' @section Git commands:
#' `git merge`.
#' @return The path to the new project
#' @export
#'
#' @examplesIf interactive()
#' parent_path <- withr::local_tempdir()
#' path <- exo_conflict(parent_path = parent_path)
exo_conflict <- function(parent_path) {

  path <- file.path(parent_path, "conflict")

  withr::local_options(usethis.quiet = TRUE)

  dir_create(path)
  original_dir <- getwd()

  withr::local_dir(path)
  gert::git_init()

  file.copy(
    system.file("exo_conflict-Rprofile.R", package = "saperlipopette"),
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


  gert::git_branch_create("feature")
  brio::write_lines(text = c("a <- 10", "b <- 2", "c <- 3"), path = new_script)
  gert::git_add(new_script)
  git_commit("feat: improve script")

  if ("main" %in% gert::git_branch_list()[["name"]]) {
    gert::git_branch_checkout("main")
  } else {
    gert::git_branch_checkout("master")
  }
  brio::write_lines(text = c("a <- 11", "b <- 2"), path = new_script)
  gert::git_add(new_script)
  git_commit("feat: amend script")

  usethis::local_project(original_dir, force = TRUE)

  cli::cli_alert_info("Follow along in {path}!")

  return(path)
}
