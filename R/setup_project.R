#' Setup a standardized folder and file structure for a research analysis project.
#'
#' This starts the project by setting up a common folder and file infrastructure,
#' as well as adding some useful files to start the project.
#'
#' @param path A path to a new directory.
#'
#' @return Project setup with folders and files necessary for a standard research project.
#' @export
#'
#' @examples
#' \dontrun{
#' # Use a temporary location
#' new_proj_name <- fs::path_temp("Analysis")
#' setup_project(new_proj_name)
#' }
setup_project <-
  function(path) {
    stopifnot(is.character(path))
    proj_path <- fs::path_abs(path)
    proj_name <- fs::path_file(proj_path)
    
    if (grepl(" ", basename(proj_path))) {
      rlang::warn("Project name has a space in it, replacing with a dash (-).")
      proj_path <- path_remove_spaces(proj_path)
    }
    
    if (fs::dir_exists(proj_path)) {
      cli::cli_abort(c("The {.val {proj_path}} folder already exists, so project creation is canceled.",
                       "i" = "Delete the folder or use another name (not {.val {proj_name}}) for your project."))
    }
    proj_template <- find_template("projects", "basic-analysis")
    fs::dir_copy(proj_template, new_path = proj_path)
    
    withr::with_dir(
      new = proj_path,
      code = {
        update_template("DESCRIPTION", data = list(ProjectName = proj_name))
        update_template("template-Rproj", paste0(proj_name, ".Rproj"))
        fs::file_delete("template-Rproj")
        update_template("README.md", data = list(ProjectName = proj_name))
        suppressMessages(create_report())
      })
  }

# Utilities -----------------------------------------------------

path_remove_spaces <- function(path) {
  path_as_vector <- fs::path_split(path)[[1]]
  last_dir <- length(path_as_vector)
  path_as_vector[last_dir] <- gsub(" +", "-", path_as_vector[last_dir])
  fs::path_join(path_as_vector)
}