#' "Hey I'd like to make my commits in a branch look informative and smart!"
#'
#' @description
#' I am working in a feature branch that's all my own.
#' I made many small commits as I was figuring things out.
#' Now I want the commits to tell a story for the PR reviewers,
#' and not a story of how many stupid mistakes I made!
#' The tool for that is `git base --interactive` also available as `git rebase -i`.
#' Useful links:
#' - <https://jvns.ca/blog/2023/11/06/rebasing-what-can-go-wrong-/>
#' - <https://wizardzines.com/comics/rules-for-rebasing/>
#' - <https://github.com/MikeMcQuaid/GitInPractice/blob/main/06-RewritingHistoryAndDisasterRecovery.adoc#rebase-commits-interactively-git-rebase-interactive>
#'
#'
#' @inheritParams exo_one_small_change
#'
#' @section Git commands:
#' `git rebase -i`
#' @return The path to the new project
#' @export
#'
#' @examplesIf interactive()
#' parent_path <- withr::local_tempdir()
#' path <- exo_rebase_i(parent_path = parent_path)
exo_rebase_i <- function(parent_path) {

  path <- file.path(parent_path, "rebase-i")

  withr::local_options(usethis.quiet = TRUE)

  dir_create(path)
  original_dir <- getwd()

  withr::local_dir(path)
  gert::git_init()

  file.copy(
    system.file("exo_rebase_i-Rprofile.R", package = "saperlipopette"),
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

  gert::git_branch_create("feature")

  ci_file1 <- "ci.yml"

  fs::file_create(ci_file1)
  brio::write_lines(text = c("do: yes"), path = ci_file1)
  gert::git_add(ci_file1)
  git_commit("add ci configuration")

  script <- "bla.R"

  fs::file_create(script)
  brio::write_lines(text = c("1/0"), path = script)
  gert::git_add(script)
  git_commit("add script")


  brio::write_lines(text = c("do: true"), path = ci_file1)
  gert::git_add(ci_file1)
  git_commit("try to fix ci")
  brio::write_lines(text = c("do: 1"), path = ci_file1)
  gert::git_add(ci_file1)
  git_commit("try to fix ci")

  brio::write_lines(text = c("1/Inf"), path = script)
  gert::git_add(script)
  git_commit("try to fix script")

  brio::write_lines(text = c(c("do: 1", "save: 1")), path = ci_file1)
  gert::git_add(ci_file1)
  git_commit("add a ci thing")

  brio::write_lines(text = c("1/2"), path = script)
  gert::git_add(script)
  git_commit("fix script")

  usethis::local_project(original_dir, force = TRUE)

  cli::cli_alert_info("Follow along in {path}!")

  return(path)
}
