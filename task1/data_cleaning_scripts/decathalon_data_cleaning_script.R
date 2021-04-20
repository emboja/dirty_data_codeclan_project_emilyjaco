library(readr)
library(tidyverse)
library(dplyr)
library(janitor)

# Read in data using read_rds()
decathalon <- read_rds("raw_data/decathlon.rds")
# Convert row name to column called athlete_name
decathalon <- decathalon %>%rownames_to_column("athlete_name")

decathalon

# Clean data, rename columns, turn all athlete names to title
decathalon <- decathalon %>% clean_names()
decathalon <- decathalon %>% mutate(athlete_name = str_to_title(athlete_name))
decathalon

#Write cleaned data to a .csv file
write_csv(decathalon, "decathalon.csv")

