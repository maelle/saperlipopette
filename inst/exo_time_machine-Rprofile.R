if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}
cli::cli_alert_danger("I mistakenly run {.code git reset hard} so lost my feature commit.")
cli::cli_alert_danger("I want to get it back!")
cli::cli_alert_info("For more help use {.run tip()}")

tip <- function() {
  cli::cli_li("{.code git reflog} to add a first chunk")
  cli::cli_li('{.code reset HEAD@{1}}')
  cli::cli_li('Examine Git history.')

}
