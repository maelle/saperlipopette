if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}
cli::cli_alert_danger("I mistakenly run {.code git reset hard} so lost my feature commit.")
cli::cli_alert_danger("I want to get it back!")
cli::cli_alert_info("See {.url https://ohshitgit.com/#magic-time-machine}")
cli::cli_alert_info("For more help use {.run tip()}")

tip <- function() {
  cli::cli_li("{.code git reflog} to add a first chunk")
  cli::cli_li('{.code git reset --hard HEAD@{1}}')
  cli::cli_li('Note that --hard does not always make sense, but git reset is always the command')
  cli::cli_li('Examine Git history.')

}
