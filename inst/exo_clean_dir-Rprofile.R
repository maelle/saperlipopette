if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

cli::cli_alert_danger('"Hey, how do I remove all my debugging left-over stuff at once?"')
cli::cli_alert_danger("I want to remove the 'debugging' folder and 'debug' files.")
cli::cli_alert_info("See {.url https://git-scm.com/docs/git-clean}")
cli::cli_alert_info("For more help use {.run tip()}")

tip <- function() {
  cli::cli_li(
    items = c(
      "Examine Git history and your files.",
      "{.code git clean -n -d}",
      "{.code git clean -f -d}",
      "Examine Git history and your files."
    )
  )

}
