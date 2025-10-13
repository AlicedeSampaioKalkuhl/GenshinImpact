# data preparation 
library(tidyverse)
library(purrr)
library(rmarkdown)
library(gtools)
library(DT)
library(tableHTML)

level_up_materials <- read.csv("character_materials.csv") %>% 
  separate_rows(character,sep=' & ')
local_specialties <- read.csv("local_specialties.csv") %>% separate_rows(character,sep=' & ')
all_characters <- read.csv("all_characters.csv") %>% group_by(element) %>% mutate(element_score=n()) %>% ungroup()
talents <- read.csv("talents.csv") %>% 
  separate_rows(character,sep=' & ')
characters <- purrr::reduce(list(all_characters,level_up_materials,local_specialties,talents), dplyr::left_join, by = "character") %>% mutate(ascension = case_when(
  element == "Traveler" ~ "Brilliant Diamond",
  element == "Pyro" ~ "Agnidus Agate",
  element == "Hydro" ~ "Varunada Lazurite",
  element == "Dendro" ~ "Nagadus Emerald",
  element == "Electro" ~ "Vajrada Amethyst",
  element == "Anemo" ~ "Vayuda Turquoise",
  element == "Cryo" ~ "Shivada Jade",
  element == "Geo" ~ "Prithiva Topaz")) 
save(characters,file="../../GenshinImpact/data/characters.rda")
artifacts <- read.csv("artifacts.csv")
save(artifacts,file="../../GenshinImpact/data/artifacts.rda")
constellations <- c("NA","C0","C1","C2","C3","C4","C5","C6")
save(constellations,file="../../GenshinImpact/data/constellations.rda")
stats <- c("ATK","DEF","EM","ER","HP","PHYS","Anemo DMG","Dendro DMG","Electro DMG","Geo DMG","Hydro DMG","Pyro DMG")
save(stats,file="../../GenshinImpact/data/stats.rda")
style <- c("Main","DPS","Sub DPS","Shielder","Healer","Support","Exploration","Unused")
save(style,file="../../GenshinImpact/data/style.rda")