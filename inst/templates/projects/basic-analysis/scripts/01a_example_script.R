# Description: tidy local genetic correlation results

# Load packages -----------------------------------------------------------

library(here)

# Set arguments -----------------------------------------------------------

args <-
    list(
        out_dir = here::here("results", "01_example_results")
        # List all of the input arguments and paths to your script here
    )

# Load data ---------------------------------------------------------------



# Main --------------------------------------------------------------------

# # Remove if you are not running this as a nohup job
# print(str_c(Sys.time(), " - Starting analysis"))


# Save data ---------------------------------------------------------------

# Create directory and save file(s)
dir.create(out_dir, showWarnings = T)
# saveRDS(
#   object = ,
#   file = file.path(out_dir, "example_output.rds")
# )

# # Remove if you are not running this as a nohup job
# print(str_c(Sys.time(), " - Done!"))
