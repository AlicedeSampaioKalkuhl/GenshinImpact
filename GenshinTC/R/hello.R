#' @import tidyverse

load_account <- function(chars,build,weapon,artifact) {
  characters <- read.csv("my_characters.csv",header=T) # my characters
  builds <- read.csv("builds.csv",header=T) # builds used
  weapons <- read.csv("my_weapons.csv",header=T) # my weapons
  artifacts <- read.csv("artifactfarming.csv",header=T)

}
