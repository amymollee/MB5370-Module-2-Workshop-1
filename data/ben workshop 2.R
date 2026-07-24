# Workshop 2 
# Keystone Exercise: Estuary Fish Survey - Data Rescue Mission

# Load packages
library(tidyverse) # Inc dplyr, ggplot2 etc
library(readxl) # For reading in Excel files
library(lubridate)

# Load datasets
estuary_metadata <- read.csv("estuary_metadata.csv")
estuary_sonde_data <- read.csv("estuary_sonde_data.csv")
species_dictionary <- read.csv("species_dictionary.csv")

# Phase 1: Ingestion and Decontamination ####

# Phase 1.1: Excel Tab Iteration ####

# Get all sheet names from the file
sheets <- excel_sheets("estuary_catch_log.xlsx")
sheets

# Names = "Lower_ross" "Mid_Ross " "ROSS MOUTH" "Upper Ross"

# Read all tabs and bind into one data frame
catch_combined <- sheets |>
  map(\(sheet) read_excel("estuary_catch_log.xlsx", sheet = sheet)) |>
  list_rbind()

# Check data using glimpse()
glimpse(catch_combined)

# Check data using head()
head(catch_combined)

# Check data using tail()
tail(catch_combined)

# Can't tell from these outputs how many levels of site and species we have. Two options: let's check those explicitly by using distinct() or can convert to factors
# Let's look at the distinct values first, as we might need to clean before converting to factor vars.

catch_combined |> 
  distinct(site)

catch_combined |> 
  distinct(species)

# OK, so we have four species in there as well as four sites which look to be located at different points on the Ross River.
# Need to:
#  - Fix site names and place in reasonable order. 
#  - Can decide this now or we can load the metadata and ensure consistency
#  - Fix species names - to do this we'll need to make consistent and then use the taxonomic dictionary to translate to scientific names.

# Inspect meta data
head(estuary_metadata)
glimpse(estuary_metadata)

# Site names are all over the place in the metadata too - will need to standardise.


catch_combined <- catch_combined |>
  mutate(
    site = str_to_lower(str_trim(site)),
    site = str_replace_all(site, " ", "_")) |> 
  # Convert all chr to fct
  mutate(across(where(is.character), as_factor)
  )

metadata <- estuary_metadata |>
  mutate(
    site_name = str_to_lower(str_trim(site_name)),
    site_name = str_replace_all(site_name, " ", "_")) |> 
  # Convert all chr to fct
  mutate(across(where(is.character), as_factor)
  )


# Check data
catch_combined |> 
  str()

glimpse(metadata)

# Check species_dictionary
head(species_dictionary)


# Check sonde data
head(estuary_sonde_data)
str(estuary_sonde_data)
glimpse(estuary_sonde_data)
summary(estuary_sonde_data)


# Environmental variables look like they are mostly in good shape (all numeric), however the turbidity data has a failed value (-999) so we'll need to deal with that
# Site looks ok, but again should check how many levels or distinct values we have:














