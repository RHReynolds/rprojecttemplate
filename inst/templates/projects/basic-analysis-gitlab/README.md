
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->

s
[![GitLab](https://badgen.net/badge/icon/gitlab-pages?icon=gitlab&label)](#TODO)
<!-- badges: end -->

# {{ ProjectName }}

## Background

<!-- Add a description of your project. -->

*TODO: add a description of your project.*

## Code contents

*TODO: Modify the following table to suit your repository.* *TODO: If
you want to be able to view `docs/` interactively, you will need to set
up [GitLab pages](https://docs.gitlab.com/ee/user/project/pages/). The
easiest way to get started is to [create a pages website using a CI/CD
template](https://docs.gitlab.com/ee/user/project/pages/getting_started/pages_ci_cd_template.html)
– use the HTML .gitlab-ci.yml template. Remember to change the folder
from which the GitLab Pages site is built to `docs/`.*

Within this repository you will find:

| Directory            | Description                                                                                                                                                |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [docs](docs)         | Contains all `.Rmd`s and their corresponding `.html`s describing analyses performed for this project. These can be view interactively at: [link](#TODO)    |
| [logs](logs)         | For any scripts that were run outside of an `.Rmd` (e.g. scripts from the [scripts](scripts) directory), a log file was recorded and can be accessed here. |
| [R](R)               | Various functions called in [docs](docs) and [scripts](scripts).                                                                                           |
| [raw_data](raw_data) | External tables used in analyses.                                                                                                                          |
| [renv](renv)         | `renv`-related scripts                                                                                                                                     |
| [results](results)   | Results from all analyses.                                                                                                                                 |
| [scripts](scripts)   | Contains analysis scripts. Each script contains a one-line description and is also referenced in its corresponding `.Rmd`.                                 |

## Reproducibility

<!-- Modify selection below depending on how package dependencies have been managed. -->

### `renv`

<!-- Consider using renv for reproducibility. Delete this section if you will not be doing this. -->

*TODO: consider setting up `renv`, using the following
\[guide\](<https://rstudio.github.io/renv/articles/renv.html>. Modify
text below as appropriate.*

This repository uses [`renv`](https://rstudio.github.io/renv/index.html)
to create a reproducible environment for this R project.

1.  When you first launches this project, `renv` should automatically
    bootstrap itself, thereby downloading and installing the appropriate
    version of `renv` into the project library.
2.  After this has completed, you can use `renv::restore()` to restore
    the project library locally on your machine.

For more information on collaborating with `renv`, please refer to this
[link](https://rstudio.github.io/renv/articles/collaborating.html).

### `DESCRIPTION`

<!-- Consider using renv for reproducibility. Delete this section if you will not be doing this. -->

*TODO: Alternatively, if packages are managed using
`usethis::use_package("packagename")` through the `DESCRIPTION` file,
modify the text below.*

If dependencies have been managed by using
`usethis::use_package("packagename")` through the `DESCRIPTION` file,
installing dependencies is as easy as opening the
`{{ProjectName}}.Rproj` file and running this command in the console:

``` r
# install.packages("remotes")
remotes::install_deps()
```

## License

<!-- For analyses, an MIT license can be added to the project using usethis::use_mit_license(). -->
<!-- If you don't end up using an MIT license, edit below. -->

*TODO: add license using `usethis::use_mit_license()` and modify text
below as appropriate (e.g. if different license used).*

The code in this repository is released under an MIT license. This
repository is distributed in the hope that it will be useful to the
wider community, but without any warranty of any kind. Please see the
[LICENSE](LICENSE) file for more details.

## Citation

<!-- Add any necessary software citations -->

*TODO: add any necessary software citations.*
