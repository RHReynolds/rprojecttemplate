# Code in this file was taken and modified from the prodigenr package.
# Below is the license statement from prodigenr
#
# # MIT License
#
# Copyright (c) 2019 Luke W. Johnston
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

#' Setup a standardized folder and file structure for a research analysis
#' project.
#'
#' This starts the project by setting up a common folder and file
#' infrastructure,as well as adding some useful files to start the project.
#'
#' @param path A path to a new directory.
#' @param type chr. Vector specifying whether this project will be hosted on
#'   github or gitlab. Default is github.
#' @param add_gitignore logical. Specify whether gitignore should be added.
#'   Default is TRUE.
#' @param gitignore_templates chr. A character vector using values included in
#'   \code{\link[gitignore]{gi_available_templates}}. Default is "r" and
#'   "macos".
#'
#' @return Project setup with folders and files necessary for a standard
#'   research project.
#' @export
#'
#' @examples
#' \dontrun{
#' # Use a temporary location
#' new_proj_name <- fs::path_temp("Analysis")
#' setup_project(new_proj_name)
#' }
setup_project <-
    function(path,
             type = c("github", "gitlab"),
             add_gitignore = TRUE,
             gitignore_templates = c("r", "macos")) {
        stopifnot(is.character(path))
        proj_path <- fs::path_abs(path)
        proj_name <- fs::path_file(proj_path)

        if (length(type) > 1) {
            rlang::warn(
                c(
                    "More than one project type provided.",
                    " User must choose between github/gitlab-friendly format.",
                    " Default github-friendly template used."
                )
            )
            type <- "github"
        }

        if (grepl(" ", basename(proj_path))) {
            rlang::warn(
                "Project name has a space in it, replacing with a dash (-)."
            )
            proj_path <-
                path_remove_spaces(proj_path)
        }

        if (fs::dir_exists(proj_path)) {
            cli::cli_abort(
                c(
                    "The {.val {proj_path}} folder already exists, so project creation is canceled.",
                    "i" = "Delete the folder or use another name (not {.val {proj_name}}) for your project."
                )
            )
        }

        if (type == "github") {
            proj_template <-
                find_template(
                    "projects",
                    "basic-analysis"
                )
            fs::dir_copy(proj_template, new_path = proj_path)

            withr::with_dir(
                new = proj_path,
                code = {
                    update_template(
                        "DESCRIPTION",
                        data = list(ProjectName = proj_name)
                    )
                    update_template(
                        "template-Rproj",
                        paste0(proj_name, ".Rproj")
                    )
                    fs::file_delete("template-Rproj")
                    update_template(
                        "README.rmd",
                        data = list(ProjectName = proj_name)
                    )
                }
            )
        } else if (type == "gitlab") {
            proj_template <-
                find_template(
                    "projects",
                    "basic-analysis-gitlab"
                )
            fs::dir_copy(proj_template, new_path = proj_path)

            withr::with_dir(
                new = proj_path,
                code = {
                    update_template(
                        "DESCRIPTION",
                        data = list(ProjectName = proj_name)
                    )
                    update_template(
                        "template-Rproj",
                        paste0(proj_name, ".Rproj")
                    )
                    fs::file_delete("template-Rproj")
                    update_template(
                        "README.rmd",
                        data = list(ProjectName = proj_name)
                    )
                    update_template(
                        "index.rmd",
                        data = list(ProjectName = proj_name)
                    )
                }
            )
        }

        cli::cli_alert_success(
            c(
                "The {.val {proj_path}} folder has been created."
            )
        )

        if (add_gitignore == TRUE) {
            write_gitignore(
                path = proj_path,
                gitignore_templates = gitignore_templates
            )
        }
    }

# Utilities -----------------------------------------------------

path_remove_spaces <- function(path) {
    path_as_vector <- fs::path_split(path)[[1]]
    last_dir <- length(path_as_vector)
    path_as_vector[last_dir] <- gsub(" +", "-", path_as_vector[last_dir])
    fs::path_join(path_as_vector)
}

write_gitignore <-
    function(path, gitignore_templates) {
        # fetch gitignore template
        cli::cli_alert_info(
            c(
                "Fetching the specified gitignore template."
            )
        )

        gi_template <-
            gitignore::gi_fetch_templates(
                gitignore_templates,
                copy_to_clipboard = TRUE
            )

        # check whether template ignores any of the folders added
        folders_created <-
            fs::dir_ls(path, type = "directory") %>%
            basename() %>%
            stringr::str_c(., "/", sep = "")

        gi_template_splitted <- unlist(strsplit(gi_template, "\n"))

        gi_template_splitted <-
            gi_template_splitted[!(gi_template_splitted %in% folders_created)]

        # write gitignore
        xfun::write_utf8(
            gi_template_splitted,
            file.path(path, ".gitignore")
        )
        cli::cli_alert_success(
            c(
                "The {.val {file.path(path, '.gitignore')}} has been created."
            )
        )
    }
