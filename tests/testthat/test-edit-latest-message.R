test_that("exo_latest_message() works", {
  rlang::local_options(cli.default_handler = function(msg) invisible(NULL))
  parent_path <- withr::local_tempdir()
  path <- exo_latest_message(parent_path = parent_path)
  expect_equal(fs::path_file(path), "latest-message")
  expect_snapshot(gert::git_log(repo = path)[["commit"]])
})
