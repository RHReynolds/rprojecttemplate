# rprojecttemplate 0.99.2

NEW FEATURES

* Updated GitLab README.Rmd to include additional sections (using private GitLab packages, targets, AWS, Docker).

FIXES

*

# rprojecttemplate 0.99.1

NEW FEATURES

* Added a project template for GitLab, which can be accessed by using argument `type` in `setup_project()`.
* `update_index()`: function that will generate an md-formatted table containing links to .htmls in a specified folder. This function can be used to generate the `index.html` page that will serve as the landing page for GitLab pages or GitHub pages. 
* Added tests for `setup_project()`

FIXES

* [#6b6c460](https://github.com/RHReynolds/rprojecttemplate/commit/6b6c4604f55ff08a70338b3e196f17ce537daf2f): permit use of `.[qQ]md` in addition to `.[rR]md` in `update_index()`
* [#dafe54c](https://github.com/RHReynolds/rprojecttemplate/commit/dafe54c7b4d079a80e96db4199f8bbddd352d5f5): fixed bug where some created folders were ignored in fetched gitignore templates
* [#0c8450e](https://github.com/RHReynolds/rprojecttemplate/commit/0c8450ed928ce5b17aac16aa07ab9ce0293c9d28): fixed error with `setup_project()` that prevented `.gitignore` being copied over when generating project. Resulted in addition of 2 new arguments:
    * `add_gitignore` - default set to TRUE for backwards compatibility
    * `gitignore_template` - default set to "r" and "macos" for backwards compatibility
* [#481ad7c](https://github.com/RHReynolds/rprojecttemplate/commit/481ad7c9829f6a06f9881ac26464ccdce5df25c0): fixed error with `update_index()` that occurred when `include_number = FALSE`
* [#ad7d312](https://github.com/RHReynolds/rprojecttemplate/commit/ad7d3122221d04215316ed4f0e68c92912141c06): fixed error with `update_index()` that occurs in newer versions of [R](https://github.com/tidyverse/dplyr/issues/6793#issuecomment-1475178979)

# rprojecttemplate 0.99.0

NEW FEATURES

* Added a `NEWS.md` file to track changes to the package.
