if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

cli::cli_alert_danger('"Oh shit, I committed and immediately realized I need to make one small change!"')
cli::cli_alert_danger("I wanted to list 3 things in my bla file, not only two!")
cli::cli_alert_info("See {.url https://ohshitgit.com/#change-last-commit}")
cli::cli_alert_info("For more help use {.run tip()}")

tip <- function() {
  cli::cli_li(
    items = c(
      "Add 'thing 3' to the {.path bla} file and save it.",
      "Add 'bla' file to Git.",
      "{.code git commit --amend --no-edit}",
      "Examine Git history."
    )
  )
}
