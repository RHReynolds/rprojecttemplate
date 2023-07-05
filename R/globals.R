# bypass R CMD Check notes, related to tidyverse non-standard evaluation
# https://www.r-bloggers.com/2019/08/no-visible-binding-for-global-variable/
utils::globalVariables(
    c(
        "Description",
        "file_ext",
        "file_name",
        "file_paths",
        "file_type",
        "md",
        "html",
        "No",
        "Title",
        "rmd",
        "."
    )
)
