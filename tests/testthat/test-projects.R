# project creation - github ----------------------------------------------------
new_project <- fs::path_temp("testing")
setup_project(new_project, type = "github", add_gitignore = TRUE)

test_that("project is set up", {
  expect_true(fs::dir_exists(new_project))
  
  files_created <- fs::dir_ls(new_project, recurse = TRUE, all = TRUE)
  folders_created <- fs::dir_ls(new_project, type = "directory")
  expect_equal(sort(basename(folders_created)),
               sort(c("R", "docs", "logs", "raw_data", "results", "scripts")))
  
  expect_match(files_created, ".*DESCRIPTION$", all = FALSE)
  expect_match(files_created, ".*testing\\.Rproj$", all = FALSE)
  # TODO: github currently has no index, although this is likely to change
  expect_no_match(files_created, ".*index\\.rmd$", all = FALSE)
  expect_match(files_created, ".*\\.gitignore$", all = FALSE)
})

fs::dir_delete(new_project)

# project creation - gitlab ----------------------------------------------------
new_project <- fs::path_temp("testing")
setup_project(new_project, type = "gitlab", add_gitignore = TRUE)

test_that("project is set up", {
  expect_true(fs::dir_exists(new_project))
  
  files_created <- fs::dir_ls(new_project, recurse = TRUE, all = TRUE)
  folders_created <- fs::dir_ls(new_project, type = "directory")
  expect_equal(sort(basename(folders_created)),
               sort(c("R", "docs", "logs", "raw_data", "man", "results", "scripts")))
  
  expect_match(files_created, ".*DESCRIPTION$", all = FALSE)
  expect_match(files_created, ".*testing\\.Rproj$", all = FALSE)
  expect_match(files_created, ".*index\\.rmd$", all = FALSE)
  expect_match(files_created, ".*\\.gitignore$", all = FALSE)
  
})

fs::dir_delete(new_project)

# general project creation -----------------------------------------------------
test_that("project setup works correctly", {
  # Error if no input provided
  expect_error(setup_project(1))
  
  # Warning if incorrect name provided
  temp_dir <- tempdir()
  proj_with_space <- fs::file_temp("test new", tmp_dir = temp_dir)
  expect_warning(setup_project(proj_with_space, type = "github", add_gitignore = FALSE))
  expect_true(fs::file_exists(sub("test new", "test-new", proj_with_space)))
  fs::dir_delete(sub("test new", "test-new", proj_with_space))
  
  # Warning if no project type provided
  temp_dir <- tempdir()
  proj_type <- fs::file_temp("test-type", tmp_dir = temp_dir)
  expect_warning(setup_project(proj_type, add_gitignore = FALSE))
  expect_true(fs::file_exists(proj_type))
  fs::dir_delete(proj_type)
})


