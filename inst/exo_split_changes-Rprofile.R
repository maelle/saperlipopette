if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}
cli::cli_alert_danger("Hey I'd like to split these changes to the same file into several commits!")
cli::cli_alert_danger("I want to add my three changes to R/script.R in three commits not one.")
cli::cli_alert_info("See {.url https://git-scm.com/book/en/v2/Git-Tools-Interactive-Staging#_staging_patches}")
cli::cli_alert_info("For more help use {.run tip()}")

tip <- function() {
  ul <- cli::cli_ul()
  cli::cli_li("Examine Git staging area.")
  cli::cli_li("{.code git add --patch} to add a first chunk")
  ulid <- cli::cli_ul()
  cli::cli_li("'s' to split")
  cli::cli_li("'y' to stage the first chunk")
  cli::cli_li("'d' to discard the others")
  cli::cli_li("Optionally, '?' to see the help")
  cli::cli_end(ulid)
  cli::cli_li('{.code git commit -m "First change"}')
  cli::cli_li('{.code git add --patch} to add a second chunk')
  ulid <- cli::cli_ul()
  cli::cli_li("'s' to split")
  cli::cli_li("'y' to stage the first chunk")
  cli::cli_li("'n' once to discard the other")
  cli::cli_li("Optionally, '?' to see the help")
  cli::cli_end(ulid)
  cli::cli_li('{.code git commit -m "Second change"}')
  cli::cli_li('{.code git add *} to add the last chunk')
  cli::cli_li('{.code git commit -m "Third change"}')
  cli::cli_li('Examine Git history.')
  cli::cli_end(ul)

}
