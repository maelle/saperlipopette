test_that("one_small_change() works", {
  rlang::local_options(cli.default_handler = function(msg) invisible(NULL))
  parent_path <- withr::local_tempdir()
  path <- exo_one_small_change(parent_path = parent_path)
  expect_equal(fs::path_file(path), "one-small-change")
  expect_snapshot(gert::git_log(repo = path)[["commit"]])
})
