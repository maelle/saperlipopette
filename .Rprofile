if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

cli::cli_alert_danger('"Oh shit, I accidentally committed something to main that should have been on a brand new branch!"')
cli::cli_alert_danger("I wanted my last commit, that created bla, to be on a new branch!")
cli::cli_alert_info("See {.url https://ohshitgit.com/#accidental-commit-master}")
cli::cli_alert_info("For more help use {.run tip()}")

tip <- function() {
  cli::cli_li(
    items = c(
      "Examine Git history.",
      "Check you are on the main branch",
      "{.code git branch feat-bla}",
      "If you are no longer on the main branch, {.code git checkout main}",
      "{.code git reset HEAD~ --hard}",
      "{.code git checkout feat-bla}",
      "Examine Git history of the main and feat-bla branches."
    )
  )

}
