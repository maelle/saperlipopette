#' Create all exercises folder at once
#'
#' But do not open them!
#'
#' @inheritParams exo_one_small_change
#'
#' @return The parent path
#' @export
#'
create_all_exercises <- function(parent_path) {
  rlang::local_interactive(FALSE)

  funs <- getNamespaceExports("saperlipopette")
  funs <- setdiff(funs, "create_all_exercises")
  purrr::walk(funs, rlang::exec, parent_path = parent_path)

  fs::dir_tree(parent_path)
  return(parent_path)
}
