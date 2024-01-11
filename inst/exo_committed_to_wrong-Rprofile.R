if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

cli::cli_alert_danger('"Oh shit, I accidentally committed to the wrong branch!"')
cli::cli_alert_danger("I wanted my last commit, that created bla, to be on the feat-bla branch not hot-fix!")
cli::cli_alert_info("See {.url https://ohshitgit.com/#accidental-commit-wrong-branch}")
cli::cli_alert_info("For more help use {.run tip()}")

tip <- function() {
  cli::cli_li(
    items = c(
      "Examine Git history.",
      "{.code git checkout feat-bla}",
      "{.code git cherry-pick hot-fix}",
      "{.code git checkout hot-fix}",
      "{.code git reset HEAD~ --hard}",
      "Examine Git history of the hot-fix and feat-bla branches."
    )
  )

}
