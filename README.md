
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
path <- exo_one_small_change(parent_path)
#> ℹ Follow along in /tmp/Rtmp1WqbPh/file68263a0cd13e/one-small-change!
# what's in path
fs::dir_tree(path)
#> /tmp/Rtmp1WqbPh/file68263a0cd13e/one-small-change
#> ├── R
#> └── bla
gert::git_log(repo = path)
#> # A tibble: 2 × 6
#>   commit                          author time                files merge message
#> * <chr>                           <chr>  <dttm>              <int> <lgl> <chr>  
#> 1 2ff0d31f566e68ae0ee94b6028a3fa… Jane … 2023-12-15 16:25:00     1 FALSE "feat:…
#> 2 e227ecc55e421f70b6e30602e6a2ee… Jane … 2023-12-15 16:25:00     2 FALSE "First…
```

At this stage, the user would open the newly created R project, where
messages would indicate them what to do, an which URL to follow, to find
the corresponding ohshitgit entry. In practice here the user would
change a file, then Git add it, then run `git commit --amend --no-edit`.
The user would examine the Git history before and after this.

    #> ✖ "Oh shit, I committed and immediately realized I need to make one small change!"
    #> ✖ I wanted to list 3 things in my bla file, not only two!
    #> ℹ See <https://ohshitgit.com/#change-last-commit>
    #> • Add 'thing 3' to the 'bla' file and save it.
    #> • Add 'bla' file to Git.
    #> • git commit --amend --no-edit
    #> • Examine Git history.

That interface relies on adding an `.Rprofile` to the newly created
project, with instructions formatted with the cli package.

We’ve set the Git author, committer and date so that the automatic
commits get the same hashes, which can be useful when teaching a group:
everyone should be looking at the same hashes on their machine, except
for those commits they create themselves.

``` r
parent_path <- withr::local_tempdir()
path <- exo_one_small_change(parent_path)
#> ℹ Follow along in /tmp/Rtmp1WqbPh/file68265fa422d8/one-small-change!
gert::git_log(repo = path)
#> # A tibble: 2 × 6
#>   commit                          author time                files merge message
#> * <chr>                           <chr>  <dttm>              <int> <lgl> <chr>  
#> 1 2ff0d31f566e68ae0ee94b6028a3fa… Jane … 2023-12-15 16:25:00     1 FALSE "feat:…
#> 2 e227ecc55e421f70b6e30602e6a2ee… Jane … 2023-12-15 16:25:00     2 FALSE "First…
parent_path2 <- withr::local_tempdir()
path2 <- exo_one_small_change(parent_path2)
#> ℹ Follow along in /tmp/Rtmp1WqbPh/file68265803fa31/one-small-change!
gert::git_log(repo = path2)
#> # A tibble: 2 × 6
#>   commit                          author time                files merge message
#> * <chr>                           <chr>  <dttm>              <int> <lgl> <chr>  
#> 1 2ff0d31f566e68ae0ee94b6028a3fa… Jane … 2023-12-15 16:25:00     1 FALSE "feat:…
#> 2 e227ecc55e421f70b6e30602e6a2ee… Jane … 2023-12-15 16:25:00     2 FALSE "First…
```
