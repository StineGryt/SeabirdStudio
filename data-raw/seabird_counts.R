## code to prepare `seabird_counts`


library(readxl)
library(dplyr)

# Load the JNCC dataset
raw <- read_excel("data-raw/comparative-seabirds-count-dataset-revised-20240708.xlsx",
                  sheet = "1_SC_S2K_dataset",
                  skip = 3)


# Clean and simplify dataset
seabird_counts <- raw |>
  select(
    colony = Site,
    species = Species,
    count = `Seabirds Count adjusted count`,
  ) |>
  mutate(count = as.numeric(count)) |>
  filter(!is.na(count), count > 0) |>
  group_by(colony, species) |>
  summarise(count = sum(count), .groups = "drop")

# ---SUBSET---
# Keep top 10 species
top_species <- seabird_counts |>
  count(species, sort = TRUE) |>
  slice_head(n = 10) |>
  pull(species)

# Keep top 25 colonies
top_colonies <- seabird_counts |>
  count(colony, sort = TRUE) |>
  slice_head(n = 25) |>
  pull(colony)

seabird_counts <- seabird_counts |>
  filter(
    species %in% top_species,
    colony %in% top_colonies
  )

usethis::use_data(seabird_counts, overwrite = TRUE)
