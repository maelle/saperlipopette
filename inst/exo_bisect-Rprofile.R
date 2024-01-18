if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

cli::cli_alert_danger('"Hey, since when has my script {.path R/script.R} stopped to work?"')
cli::cli_alert_danger("I need to use git bisect.")
cli::cli_alert_info("For more help use {.run tip()}")

tip <- function() {
  cli::cli_li(
    items = c(
      "Examine Git history.",
      "Source R/script.R and see it errors.",
      "{.code git bisect start}",
      "{.code git bisect bad} (the current version is broken).",
      "{.code git bisect good 7d4d919e18bdedcebcd6a2783c8d73760f69d3dc} (the first was not).",
      "At each step source R/script.R and type {.code git bisect bad} if it errors, {.code git bisect good} if not.",
      "Continue until git bisect tells you about the culprit.",
      "{.code git bisect reset} to exit.",
      "Examine Git diff at that commit.",
      "Advanced: instead of 'at each step' steps, run {.code git bisect run Rscript R/script.R}."
    )
  )

}
