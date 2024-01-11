#' "Oh shit, I committed and immediately realized I need to make one small change!"
#'
#' @description
#' To go with <https://ohshitgit.com/#change-last-commit>
#'
#'
#' @param parent_path Path where to create the exercise repo
#'
#' @section Git commands:
#' `git commit --amend --no-edit`
#' @return The path
#' @export
#'
#' @examplesIf interactive()
#' parent_path <- withr::local_tempdir()
#' path <- exo_one_small_change(parent_path = parent_path)
#' # Now add "thing 3" to the "bla" file
#' # And amend the latest commit
exo_one_small_change <- function(parent_path) {

  path <- file.path(parent_path, "one-small-change")

  withr::local_options(usethis.quiet = TRUE)

  dir_create(path)
  original_dir <- getwd()

  withr::local_dir(path)
  gert::git_init()

  file.copy(
    system.file("exo_one_small_change-Rprofile.R", package = "saperlipopette"),
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

  fs::file_create("bla")
  brio::write_lines(
    text = c("thing 1", "thing 2"),
    path = "bla"
  )
  gert::git_add("bla")
  git_commit("feat: add bla")

  usethis::local_project(original_dir, force = TRUE)

  cli::cli_alert_info("Follow along in {path}!")

  return(path)
}
