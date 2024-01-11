if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

cli::cli_alert_danger('"Oh shit, I need to undo my changes to a file!"')
cli::cli_alert_danger("I want bla.txt to be as it was before the 'fix: fix things' commit!")
cli::cli_alert_info("See {.url https://ohshitgit.com/#undo-a-file}")
cli::cli_alert_info("For more help use {.run tip()}")

tip <- function() {
  cli::cli_li(
    items = c(
      "Examine Git history.",
      "{.code git checkout [saved hash] -- bla.txt}",
      "{.code git commit -m 'no need to copy-paste yay'}",
      "Examine Git history."
    )
  )

}
