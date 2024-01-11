test_that("create_all_exercises() works", {
  skip_on_os("windows")
  rlang::local_options(cli.default_handler = function(msg) invisible(NULL))
  parent_path <- withr::local_tempdir()
  expect_snapshot(
    create_all_exercises(parent_path),
    transform = function(x) gsub(parent_path, "", x, fixed = TRUE)
  )
})
