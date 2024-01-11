test_that("dir_create() errors if the path exist", {
  rlang::local_options(cli.default_handler = function(msg) invisible(NULL))
  rlang::local_options(usethis.quiet = FALSE)
  parent_path <- withr::local_tempdir()
  path <- exo_split_changes(parent_path = parent_path)
  expect_error(
    exo_split_changes(parent_path = parent_path)
  )
})
