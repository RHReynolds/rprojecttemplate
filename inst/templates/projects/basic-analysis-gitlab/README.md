
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->
<!-- badges: end -->
# {{ ProjectName }}

## Background

<!-- Add a description of your project. -->
*TODO: add a description of your project.*

## Code contents

*TODO: Modify the following table to suit your repository.* *TODO: If you want to be able to view `docs/` interactively, you will need to set up [github pages](https://pages.github.com/) -- this is incredibly easy and fast to do. Remember to change the folder from which the Github Pages site is built to `docs/`.*

Within this repository you will find:

<table>
<colgroup>
<col width="11%" />
<col width="88%" />
</colgroup>
<thead>
<tr class="header">
<th>Directory</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><a href="docs" class="uri">docs</a></td>
<td>Contains all <code>.Rmd</code>s and their corresponding <code>.html</code>s describing analyses performed for this project. These can be view interactively at: <a href="#TODO">link</a></td>
</tr>
<tr class="even">
<td><a href="logs" class="uri">logs</a></td>
<td>For any scripts that were run outside of an <code>.Rmd</code> (e.g. scripts from the <a href="scripts" class="uri">scripts</a> directory), a log file was recorded and can be accessed here.</td>
</tr>
<tr class="odd">
<td><a href="R" class="uri">R</a></td>
<td>Various functions called in <a href="docs" class="uri">docs</a> and <a href="scripts" class="uri">scripts</a>.</td>
</tr>
<tr class="even">
<td><a href="raw_data" class="uri">raw_data</a></td>
<td>External tables used in analyses.</td>
</tr>
<tr class="odd">
<td><a href="renv" class="uri">renv</a></td>
<td><code>renv</code>-related scripts</td>
</tr>
<tr class="even">
<td><a href="results" class="uri">results</a></td>
<td>Results from all analyses.</td>
</tr>
<tr class="odd">
<td><a href="scripts" class="uri">scripts</a></td>
<td>Contains analysis scripts. Each script contains a one-line description and is also referenced in its corresponding <code>.Rmd</code>.</td>
</tr>
</tbody>
</table>

## Reproducibility

<!-- Modify selection below depending on how package dependencies have been managed. -->
### `renv`

<!-- Consider using renv for reproducibility. Delete this section if you will not be doing this. -->
*TODO: consider setting up `renv`, using the following \[guide\](<https://rstudio.github.io/renv/articles/renv.html>. Modify text below as appropriate.*

This repository uses [`renv`](https://rstudio.github.io/renv/index.html) to create a reproducible environment for this R project.

1.  When you first launches this project, `renv` should automatically bootstrap itself, thereby downloading and installing the appropriate version of `renv` into the project library.
2.  After this has completed, you can use `renv::restore()` to restore the project library locally on your machine.

For more information on collaborating with `renv`, please refer to this [link](https://rstudio.github.io/renv/articles/collaborating.html).

### `DESCRIPTION`

<!-- Consider using renv for reproducibility. Delete this section if you will not be doing this. -->
*TODO: Alternatively, if packages are managed using `usethis::use_package("packagename")` through the `DESCRIPTION` file, modify the text below.*

If dependencies have been managed by using `usethis::use_package("packagename")` through the `DESCRIPTION` file, installing dependencies is as easy as opening the `{{ProjectName}}.Rproj` file and running this command in the console:

``` r
# install.packages("remotes")
remotes::install_deps()
```

## License

<!-- For analyses, an MIT license can be added to the project using usethis::use_mit_license(). -->
<!-- If you don't end up using an MIT license, edit below. -->
*TODO: add license using `usethis::use_mit_license()` and modify text below as appropriate (e.g. if different license used).*

The code in this repository is released under an MIT license. This repository is distributed in the hope that it will be useful to the wider community, but without any warranty of any kind. Please see the [LICENSE](LICENSE) file for more details.

## Citation

<!-- Add any necessary software citations -->
*TODO: add any necessary software citations.*
