##CleanData.R
##Data Cleaning for Project1.Rmd

library(tidyverse)
library(here)
library(readr)

Project1.here <- ("zoo.csv")
Project1 <- read_csv(Project1.here,
                     col_types = cols(
                       animal_name = col_character(),
                       hair = col_logical(),
                       feathers = col_logical(),
                       eggs = col_logical(),
                       milk = col_logical(),
                       airborne = col_logical(),
                       aquatic = col_logical(),
                       predator = col_logical(),
                       toothed = col_logical(),
                       backbone = col_logical(),
                       breathes = col_logical(),
                       venomous = col_logical(),
                       fins = col_logical(),
                       legs = col_double(),
                       tail = col_logical(),
                       domestic = col_logical(),
                       catsize = col_logical(),
                       class_type = col_character()
                     ))

Project1[,"data origin"] <- "zoo.csv"

# Code from http://www.cookbook-r.com/Manipulating_data/Adding_and_removing_columns_from_a_data_frame/


##Load zoo2.csv

Project1.2.here <- ("zoo2.csv")
Project1.2 <- read_csv(Project1.2.here,
                       col_types = cols(
                         animal_name = col_character(),
                         hair = col_logical(),
                         feathers = col_logical(),
                         eggs = col_logical(),
                         milk = col_logical(),
                         airborne = col_logical(),
                         aquatic = col_logical(),
                         predator = col_logical(),
                         toothed = col_logical(),
                         backbone = col_logical(),
                         breathes = col_logical(),
                         venomous = col_logical(),
                         fins = col_logical(),
                         legs = col_double(),
                         tail = col_logical(),
                         domestic = col_logical(),
                         catsize = col_logical(),
                         class_type = col_character()
                       ))


Project1.2[,"data origin"] <- "zoo2.csv"

# Code from http://www.cookbook-r.com/Manipulating_data/Adding_and_removing_columns_from_a_data_frame/

Project1.3.here <- here("zoo3.csv")


Project1.3 <- read_csv("zoo3.csv",
                       col_types = cols(
                         animal_name = col_character(),
                         hair = col_logical(),
                         feathers = col_logical(),
                         eggs = col_logical(),
                         milk = col_logical(),
                         airborne = col_logical(),
                         aquatic = col_logical(),
                         predator = col_logical(),
                         toothed = col_logical(),
                         backbone = col_logical(),
                         breathes = col_logical(),
                         venomous = col_logical(),
                         fins = col_logical(),
                         legs = col_double(),
                         tail = col_logical(),
                         domestic = col_logical(),
                         catsize = col_logical(),
                         class_type = col_character()
                       ))

Project1.3[,"data origin"] <- "zoo3.csv"

# Code from http://www.cookbook-r.com/Manipulating_data/Adding_and_removing_columns_from_a_data_frame/

##Combined zoo.csv, zoo2.csv, and zoo3.csv from Kaggle
## Join all of the datasheets together

zoo.final <- Project1%>%
  full_join(Project1.2)%>%
  full_join(Project1.3)

# Code from R for Datascience by Hadley Wickham & Garrett Grolemund, Chapter 10: Relational Data with dplyr


## Give a new column called species_type to more accurately reflect the type of species
zoo.final <- zoo.final%>%
  mutate(species_type=
           case_when(
             class_type=="1"~"mammal",
             class_type=="2"~"bird",
             class_type=="3"~"reptile",
             class_type=="4"~"fish",
             class_type=="5"~"amphibian",
             class_type=="6"~"insect",
             class_type=="7"~"non-insect invertebrate"
           ))

## Will need to rename a column for accuracy of information

zoo.final %>% 
  rename(
    venomous.poisonous = venomous
  )->zoo.final
