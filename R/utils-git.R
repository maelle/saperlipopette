default_committer <- function() {
  gert::git_signature(
    name = Sys.getenv("SAPERLIPOPETTE_COMMITTER_NAME", "Jane Doe"),
    email = Sys.getenv("SAPERLIPOPETTE_COMMITTER_EMAIL", "jane@example.com"),
    time = parsedate::parse_iso_8601(
      Sys.getenv("SAPERLIPOPETTE_COMMITTER_DATE", "2023-12-15 15:25:00Z")
    )
  )
}

default_author <- function() {
  gert::git_signature(
    name = Sys.getenv("SAPERLIPOPETTE_AUTHOR_NAME", "Jane Doe"),
    email = Sys.getenv("SAPERLIPOPETTE_AUTHOR_EMAIL", "jane@example.com"),
    time = parsedate::parse_iso_8601(
      Sys.getenv("SAPERLIPOPETTE_AUTHOR_DATE", "2023-12-15 15:25:00Z")
    )
  )
}

git_commit <- function(message) {
  gert::git_commit(
    message = message,
    author = default_author(),
    committer = default_committer()
  )
}

