test_that("exo_split_changes() works", {
  rlang::local_options(cli.default_handler = function(msg) invisible(NULL))
  parent_path <- withr::local_tempdir()
  path <- exo_split_changes(parent_path = parent_path)
  expect_equal(fs::path_file(path), "split-changes")
  expect_snapshot(gert::git_log(repo = path)[["commit"]])
})
