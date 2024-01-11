#' "Oh shit, I accidentally committed to the wrong branch!"
#'
#' @description
#' To go with <https://ohshitgit.com/#accidental-commit-wrong-branch>
#'
#'
#' @inheritParams exo_one_small_change
#' @section Git commands:
#' `git cherry-pick`, `git reset`, `git checkout`
#'
#' @return The path to the new project
#' @export
#'
#' @examplesIf interactive()
#' parent_path <- withr::local_tempdir()
#' path <- exo_committed_to_wrong(parent_path = parent_path)
exo_committed_to_wrong <- function(parent_path) {

  path <- file.path(parent_path, "committed-to-wrong")

  withr::local_options(usethis.quiet = TRUE)

  dir_create(path)
  original_dir <- getwd()

  withr::local_dir(path)
  gert::git_init()

  file.copy(
    system.file("exo_committed_to_wrong-Rprofile.R", package = "saperlipopette"),
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

  gert::git_branch_create("feat-bla")
  gert::git_branch_checkout("main")

  gert::git_branch_create("hot-fix")
  brio::write_lines("lala", "fix.txt")
  gert::git_add("fix.txt")
  git_commit("fix things")

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
