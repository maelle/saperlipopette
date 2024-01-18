if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

cli::cli_alert_danger('"Hey I want the commit history of the feature branch to look smarter!"')
cli::cli_alert_info("See {.url https://www.digitalocean.com/community/tutorials/how-to-rebase-and-update-a-pull-request}")
cli::cli_alert_info("For more help use {.run tip()}")

tip <- function() {
  cli::cli_li(
    items = c(
      "Examine Git history.",
      "Find rebase commit with {.code git merge-base feature main}",
      "{.code git rebase -i <commit-id>} as many times as you need (once to reorder, once to squash, etc).",
      "Examine Git history and your files."
    )
  )

}
