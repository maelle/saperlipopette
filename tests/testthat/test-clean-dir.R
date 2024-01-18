test_that("exo_clean_dir() works", {
  rlang::local_options(cli.default_handler = function(msg) invisible(NULL))
  parent_path <- withr::local_tempdir()
  path <- exo_clean_dir(parent_path = parent_path)
  expect_equal(fs::path_file(path), "clean-dir")
  expect_snapshot(gert::git_log(repo = path)[["commit"]])
})
