
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Codecov test
coverage](https://codecov.io/gh/RHReynolds/rprojecttemplate/branch/main/graph/badge.svg)](https://app.codecov.io/gh/RHReynolds/rprojecttemplate?branch=main)
<!-- badges: end -->

# Background

This `R` package was made for personal use, and aims to create an R
project directory primed for data analysis. It has a simple focus on:

1.  Creating a standardised project folder structure with a few template
    files needed for beginning a data analysis project
2.  Use of practices that make it easier for the project to be
    reproducible and open

The structure makes use of the existing and established packages
([`devtools`](https://devtools.r-lib.org/),
[`usethis`](https://usethis.r-lib.org/), and
[`renv`](https://rstudio.github.io/renv/articles/renv.html)) and is
intended for use with RStudio.

# Installation

To access the template on RStudio first install `rprojecttemplate` with:

``` r
remotes::install_github("RHReynolds/rprojecttemplate")
```

# Usage

## Getting started

There are two ways of creating a new project: using the R console or
using the RStudio “New Project” menu option.

Through the console, use the `setup_project()` command. For example:

``` r
library(rprojecttemplate)
rprojecttemplate::setup_project("~/Desktop/test-analysis")
```

This then creates a directory tree, with template files for starting
your analysis. Open the newly created project via the `.Rproj` file.

For the RStudio approach, go to “File -\> New Project”, then “New
directory” and find the `rprojecttemplate` project in the list (it
should be listed as “Data analysis project using rprojecttemplate”).

For a more detailed tutorial see the [introduction
vignette](https://rhreynolds.github.io/rprojecttemplate/articles/rprojecttemplate.html).

# License

The code in this repository is released under an MIT license. This
repository is distributed in the hope that it will be useful to the
wider community, but without any warranty of any kind. Please see the
[LICENSE](LICENSE.md) file for more details.

# Acknowledgements

This package was heavily inspired by the
[`prodigenr`](https://github.com/rostools/prodigenr) package, thus be
sure to cite it if you use this `R` package.
