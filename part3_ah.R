#-------------------------
# Annette Hilton 
#-------------------------

library(tidyverse)
library(janitor)
library(here)

# Read in data: 

db <- readr::read_csv(here::here("data", "disease_burden.csv")) %>% 
  clean_names() %>% 
  rename(deaths_per_100k = death_rate_per_100_000) 

# Create a subset, then graph: 

db_subset <- db %>% 
  filter(country_name %in% c("United States", "Japan", "Afghanistan", "Somalia")) %>% 
  filter(age_group == "0-6 days", sex == "Both")

# Create basic line graph 

ggplot(data = db_subset, 
       aes(x = year, 
           y = deaths_per_100k)) +
  geom_line(aes(color = country_name))

ggsave(here("final_graphs", "disease_graph.png"))
