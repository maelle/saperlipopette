test_that("exo_undo_commit() works", {
  rlang::local_options(cli.default_handler = function(msg) invisible(NULL))
  parent_path <- withr::local_tempdir()
  path <- exo_undo_commit(parent_path = parent_path)
  expect_equal(fs::path_file(path), "undo-commit")
  expect_snapshot(gert::git_log(repo = path)[["commit"]])
})
