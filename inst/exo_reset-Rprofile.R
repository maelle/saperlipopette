if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

cli::cli_alert_danger('"Hey I want the commit history of the feature branch to look smarter!"')
cli::cli_alert_info("I can undo the commits and keep the changes.")
cli::cli_alert_info("For more help use {.run tip()}")

tip <- function() {
  cli::cli_li(
    items = c(
      "Examine Git history.",
      "Find last commit before the changes.",
      "{.code git reset --mixed <commit-id>}.",
      "Do one commit per file.",
      "Examine Git history and your files."
    )
  )

}
