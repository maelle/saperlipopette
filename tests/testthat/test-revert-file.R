test_that("exo_revert_file() works", {
  rlang::local_options(cli.default_handler = function(msg) invisible(NULL))
  parent_path <- withr::local_tempdir()
  path <- exo_revert_file(parent_path = parent_path)
  expect_equal(fs::path_file(path), "revert-file")
  expect_snapshot(gert::git_log(repo = path)[["commit"]])
})
