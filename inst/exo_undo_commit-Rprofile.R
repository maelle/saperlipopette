if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

cli::cli_alert_danger('"Oh shit, I need to undo a commit from like 5 commits ago!"')
cli::cli_alert_danger("I to undo my 'fix: fix things' commit as it broke stuff!")
cli::cli_alert_info("See {.url https://ohshitgit.com/#undo-a-commit}")
cli::cli_alert_info("For more help use {.run tip()}")

tip <- function() {
  cli::cli_li(
    items = c(
      "Examine Git history.",
      "{.code git revert <hash-you-see>}",
      "Examine Git history and your files."
    )
  )

}
