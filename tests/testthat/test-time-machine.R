test_that("exo_time_machine() works", {
  rlang::local_options(cli.default_handler = function(msg) invisible(NULL))
  parent_path <- withr::local_tempdir()
  path <- exo_time_machine(parent_path = parent_path)
  expect_equal(fs::path_file(path), "time-machine")
  expect_snapshot(gert::git_log(repo = path)[["commit"]])
})
