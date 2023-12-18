if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

cli::cli_alert_danger('"Oh shit, I need to change the message on my last commit!')
cli::cli_alert_danger("I made a typo!")
cli::cli_alert_info("See {.url https://ohshitgit.com/#change-last-commit-message}")
cli::cli_alert_info("For more help use {.run tip()}")

tip <- function() {
  cli::cli_li(
    items = c(
      "Examine Git history.",
      "Notice 'documennnt' should be 'document'! A typo!",
      "{.code git commit --amend}",
      "Examine Git history."
    )
  )

}
