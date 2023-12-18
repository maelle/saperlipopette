test_that("exo_committed_to_main() works", {
  rlang::local_options(cli.default_handler = function(msg) invisible(NULL))
  parent_path <- withr::local_tempdir()
  path <- exo_committed_to_main(parent_path = parent_path)
  expect_equal(fs::path_file(path), "committed-to-main")
  expect_snapshot(gert::git_log(repo = path)[["commit"]])
})
