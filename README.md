
<!-- README.md is generated from README.Rmd. Please edit that file -->

# saperlipopette

<!-- badges: start -->

[![R-CMD-check](https://github.com/maelle/saperlipopette/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/maelle/saperlipopette/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of saperlipopette is to hold functions creating Git messes,
that users would then solve, to follow <https://ohshitgit.com/>.

## Installation

You can install the development version of saperlipopette like so:

``` r
pak::pak("maelle/saperlipopette")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library("saperlipopette")
parent_path <- withr::local_tempdir()
path <- one_small_change(parent_path) # to be solved with ?one_small_change
# what's in path
fs::dir_tree(path)
#> /tmp/Rtmpurzy3s/file63834d872c86/one-small-change
#> ├── R
#> └── bla
gert::git_log(repo = path)
#> # A tibble: 2 × 6
#>   commit                          author time                files merge message
#> * <chr>                           <chr>  <dttm>              <int> <lgl> <chr>  
#> 1 d6fb48626400dd7b84dd40134ddf86… Jane … 2023-12-15 16:25:00     1 FALSE "feat:…
#> 2 26ace83d6fee02330e6f23cdd4d976… Jane … 2023-12-15 16:25:00     1 FALSE "First…
```

We’ve set the Git author and commiter so that the automatic commits get
the same hashes, which can be useful when teaching a group.

``` r
parent_path <- withr::local_tempdir()
path <- one_small_change(parent_path)
gert::git_log(repo = path)
#> # A tibble: 2 × 6
#>   commit                          author time                files merge message
#> * <chr>                           <chr>  <dttm>              <int> <lgl> <chr>  
#> 1 d6fb48626400dd7b84dd40134ddf86… Jane … 2023-12-15 16:25:00     1 FALSE "feat:…
#> 2 26ace83d6fee02330e6f23cdd4d976… Jane … 2023-12-15 16:25:00     1 FALSE "First…
parent_path2 <- withr::local_tempdir()
path2 <- one_small_change(parent_path2)
gert::git_log(repo = path2)
#> # A tibble: 2 × 6
#>   commit                          author time                files merge message
#> * <chr>                           <chr>  <dttm>              <int> <lgl> <chr>  
#> 1 d6fb48626400dd7b84dd40134ddf86… Jane … 2023-12-15 16:25:00     1 FALSE "feat:…
#> 2 26ace83d6fee02330e6f23cdd4d976… Jane … 2023-12-15 16:25:00     1 FALSE "First…
```
