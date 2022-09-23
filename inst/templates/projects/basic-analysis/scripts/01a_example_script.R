# Description: example scripts

# Load packages -----------------------------------------------------------

library(datasets)
library(here)

# Set arguments -----------------------------------------------------------

# limit hard-coding by saving inputs/outputs to variables early in a script

args <-
    list(
        out_dir = here::here("results", "01_example_results")
    )

# Load data ---------------------------------------------------------------

data <- dataset::iris

# Main --------------------------------------------------------------------

# Run all transformations to data in main body

# # Remove if you are not running this as a nohup job
# print(str_c(Sys.time(), " - Starting analysis"))

transformed_data <-
  data[c(1:10), ]

# Save data ---------------------------------------------------------------

# Create directory and save file(s)
dir.create(out_dir, showWarnings = T)
saveRDS(
  object = transformed_data,
  file = file.path(out_dir, "example_output.rds")
)

# # Remove if you are not running this as a nohup job
# print(str_c(Sys.time(), " - Done!"))
