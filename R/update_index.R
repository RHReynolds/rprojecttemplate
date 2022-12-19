#' Update index table
#'
#' @description `update_index` will generate a [`tibble`][tibble::tbl_df-class]
#'   object and display it with md formatting. It will contain the title of the
#'   analysis, as extracted from the `.rmd` with a link to the corresponding
#'   `.html`. If chosen, it will also show the number of the analysis and a
#'   description of the analysis, as extracted from the file name and `.rmd`,
#'   respectively.
#'
#' @param html_folder Character. The folder containing `.html`s to be referenced
#'   in the contents table. This path should be relative to the root folder of
#'   the R project (i.e. the folder containing the `.Rproj` file). Default is
#'   "docs/".
#' @param include_number boolean. Whether to include the numbering of the
#'   analysis i.e. if the document has been labelled with a number to indicate
#'   ordering (e.g. "`01_example.rmd`"). If no numbering requested, analyses
#'   will be ordered alphabetically. Default is TRUE.
#' @param include_description boolean. Whether to include a description of the
#'   analysis, which will be taken straight from the `.rmd`. This function
#'   assumes that that this description is described in the section preceded by
#'   "> Aim:" and ended with "<br><br>", as in the example analysis templates
#'   available in both templates. Both of these templates were generated using:
#'   https://github.com/RHReynolds/rmdplate. Default is TRUE.
#'
#' @return a [`tibble`][tibble::tbl_df-class], but in md formatting.
#' @importFrom knitr kable
#' @export
#'
#' @example
#'
#' update_index(html_folder =
#' "inst/templates/projects/basic-analysis-gitlab/docs/")
#'
#' 

update_index <- function(
    html_folder = "docs", 
    include_number = TRUE, 
    include_description = TRUE
    ) {
  
  # html_folder = "inst/templates/projects/basic-analysis-gitlab/docs/"
  contents_df <- 
    .generate_contents_df(
      html_folder, 
      include_number = include_number, 
      include_description = include_description
      ) %>% 
    knitr::kable()
  
  return(contents_df)
  
}

#' Generate table of contents
#'
#' `.generate_contents_df` will generate a [`tibble`][tibble::tbl_df-class]
#' object with the following columns:
#'   \itemize{ 
#'   \item `n`: number assigned to analysis (if argument `include_number` is TRUE)
#'   \item `title`: name of analysis
#'   \item `link`: link to analysis
#'   \item `description`: description of the analysis, as taken from `.rmd`
#'   }
#' 
#' @inheritParams update_index
#' 
#' @importFrom here here
#' @importFrom cli cli_h1 cli_alert_danger
#' @importFrom tibble tibble
#' @importFrom fs path_ext_remove path_ext
#' @importFrom dplyr mutate
#' @importFrom tidyr pivot_wider everything
#' @importFrom stringr str_extract_all str_c
#' 
#' @keywords internal
#' @noRd

.generate_contents_df <- function(html_folder, include_number, include_description){
  
  cli::cli_h1("Generating table of contents for: {.val {html_folder}}")
  
  if(!dir.exists(here::here(html_folder))){
    stop(
      cli::cli_alert_danger(
        "{.val {html_folder}} does not exist in the project root directory 
        {.val {here::here()}}. Have you provided the correct path?",
        wrap = TRUE
      )
    )
  }
  
  # Get a list of all the RMD/HTML pairings
  file_df <-
    tibble::tibble(
      file_paths = 
        list.files(
          path = here::here(html_folder), 
          pattern = "*.html|*.[rR]md", 
          full.names = FALSE
        ) %>% 
        file.path(html_folder, .)
    ) %>% 
    dplyr::mutate(
      file_name = 
        basename(file_paths) %>% 
        fs::path_ext_remove(),
      file_ext = 
        fs::path_ext(file_paths) %>% 
        stringr::str_to_lower()
    ) %>% 
    tidyr::pivot_wider(
      names_from = file_ext, 
      values_from = file_paths
      ) 
  
  contents_df <- .extract_title(file_df)
  
  if(include_number){
    
    contents_df <- 
      contents_df %>% 
      dplyr::group_by(file_name) %>% 
      dplyr::mutate(
        No = 
          stringr::str_extract_all(file_name, "[:digit:]") %>% 
          unlist() %>% 
          as.character() %>% 
          stringr::str_c(collapse = "")
      ) %>% 
      dplyr::select(
        No, everything()
      )
    
  }
  
  if(include_description){
    
    contents_df <- 
      contents_df %>% 
      dplyr::inner_join(
        .extract_description(file_df),
        by = c("file_name", "html", "rmd")
        ) %>% 
      dplyr::select(
        No, Title, Description, everything()
      )
      
  }
  
  contents_df <- 
    contents_df %>%
    dplyr::ungroup() %>% 
    dplyr::select(-file_name, -html, -rmd)
  
  return(contents_df)
  
}

#' Extract title of `.rmd`
#'
#' `.extract_title` will extract the title of the analysis from the `.rmd`, and
#' return the file_df with an added column that includes the analysis title.
#'
#' @param file_df [`tibble`][tibble::tbl_df-class] object with the following
#'   columns: \itemize{ \item `file_name`: base name of the file, without any
#'   file extension \item `html`: file path to the html version of the file
#'   \item `rmd`: file path to the rmd version of the file }
#'   
#' @return `file_df` with an added column containing the title
#'
#' @importFrom stringr str_detect str_extract str_remove_all
#' @importFrom dplyr select
#' @importFrom readr read_lines
#' @keywords internal
#' @noRd

.extract_title <- function(file_df){
  
  file_df <- 
    file_df %>% 
    dplyr::mutate(
      Title = ""
    )
  
  for(i in seq_len(nrow(file_df))){
    
    lines <- 
      file_df[i, ][["rmd"]] %>% 
      readr::read_lines()
    
    title <- 
      lines[stringr::str_detect(lines,  'title: \\".*\\"')] %>% 
      stringr::str_extract('\\".*\\"') %>% 
      stringr::str_remove_all('\\"')
    
    file_df[i, c("Title")] <- title
    
  }
  
  file_df <- 
    file_df %>% 
    dplyr::mutate(
      Title =
        stringr::str_c(
          "[", Title, "]",
          "(", html,")"
        )
    ) %>% 
    dplyr::select(
      Title, everything()
    )
  
  return(file_df)
  
}

#' Extract description of `.rmd`
#'
#' `.extract_description` will extract the description of the analysis from the
#' `.rmd`. This function assumes that that this description is described in the
#' section preceded by "> Aim:" and ended with "<br><br>", as in the example
#' analysis templates available in both templates. Both of these templates were
#' generated using:
#' https://github.com/RHReynolds/rmdplate.
#'
#' @inheritParams .extract_title
#'
#' @return `file_df` with an added column containing the description
#'
#' @importFrom stringr str_detect str_extract str_remove_all
#' @importFrom dplyr select
#' @importFrom readr read_lines
#' @keywords internal
#' @noRd

.extract_description <- function(file_df){
  
  file_df <- 
    file_df %>% 
    dplyr::mutate(
      Description = ""
    )
  
  for(i in seq_len(nrow(file_df))){
    
    lines <- 
      file_df[i, ][["rmd"]] %>% 
      readr::read_lines()
    
    description <- 
      lines[stringr::str_detect(lines,  "> Aim:")] %>% 
      stringr::str_remove_all("> Aim:") %>% 
      stringr::str_trim()
    
    file_df[i, c("Description")] <- description
    
  }
  
  return(file_df)
  
}

