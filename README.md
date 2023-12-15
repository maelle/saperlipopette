
<!-- README.md is generated from README.Rmd. Please edit that file -->

# saperlipopette

<!-- badges: start -->
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
path <- withr::local_tempdir()
one_small_change(path) # to be solved with ?one_small_change
#> [1] "/tmp/RtmpRwfeWF/file43a62bbed262"
# what's in path
fs::dir_tree(path)
#> /tmp/RtmpRwfeWF/file43a62bbed262
#> ├── R
#> └── bla
gert::git_log(repo = path)
#> # A tibble: 2 × 6
#>   commit                          author time                files merge message
#> * <chr>                           <chr>  <dttm>              <int> <lgl> <chr>  
#> 1 28555a30455dca4ce4b1d0f214b638… Maëll… 2023-12-15 15:03:34     1 FALSE "feat:…
#> 2 7a92f86679f25708d314891b21355d… Maëll… 2023-12-15 15:03:34     1 FALSE "First…
```
