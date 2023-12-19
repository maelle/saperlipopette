if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}
cli::cli_alert_danger("Hey I'd like to split these changes to the same file into several commits!")
cli::cli_alert_danger("I want to add my three changes to R/script.R in three commits not one.")
cli::cli_alert_info("See {.url https://git-scm.com/book/en/v2/Git-Tools-Interactive-Staging#_staging_patches}")
cli::cli_alert_info("For more help use {.run tip()}")

tip <- function() {
  cli::cli_li(
    items = c(
      "Examine Git staging area.",
      "{.code git add --patch} to add a first chunk ('?' to see the help, 's' to split, 'y' to stage the first chunk, 'd' to discard the others)",
      '{.code git commit -m "First change"}',
      "{.code git add --patch} to add a second chunk ('s' to split, 'y' to stage the first chunk, 'n' once to discard the other)",
      '{.code git commit -m "Second change"}',
      "{.code git add *} to add the last chunk",
      '{.code git commit -m "Third change"}',
      "Examine Git history."
    )
  )

}
