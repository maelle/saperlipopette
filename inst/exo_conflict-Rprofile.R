if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

cli::cli_alert_danger('"I want to merge feature into main."')
cli::cli_alert_danger("I will need to fix a merge conflict.")
cli::cli_alert_info("For more help use {.run tip()}")

tip <- function() {
  cli::cli_li(
    items = c(
      "Examine Git history.",
      "{.code git merge feature} on the default branch",
      "Edit R/script.R to the desired state, remove conflict markers.",
      "{.code git add R/script.R}",
      "{.code git commit}.",
      "See the merge finalize, you might need to edit a commit message.",
      "Examine Git history."
    )
  )

}
