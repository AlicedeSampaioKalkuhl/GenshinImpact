# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   https://r-pkgs.org
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'
require(tidyverse)
load("./data/characters.rda")
load("./data/artifacts.rda")
load("./data/constellations.rda")
load("./data/style.rda")
load("./data/stats.rda")

mycharacters <- data.frame(cons=character(),character=character(),style=character(),stats=character())
newcharacter <- function(mydata) {
  char <- menu(unique(characters$character),"Add a character: ")
  cons <- menu(constellations,paste0("What constellation is your ",unique(characters$character)[char],"? "))
  sty <- menu(style,title=paste0("How would you like to play ",unique(characters$character)[char],"? "))
  stat1 <- menu(stats, title="Which stat do you want to prioritise?")
  stat2 <- menu(c("Yes","No"), title="Would you like to prioritise more stats?")
  if(stat2==1){
    stat <- paste0(stat1," & ",stat2)
  }
  if(stat2==2){
    stat <- stat1
  }
  mydata <- mycharacters %>% add_row(cons=constellations[cons],character=unique(characters$character)[char],style=style[sty],stats=stats[stat],artifacts="TBD",weapon="TBD")
  return(mydata)
}

mycharacters = newcharacter(mycharacters)


changecharacter <- function(data) {
  choice <- menu(c("delete","cons","character","style","stats","artifacts","weapon"),"What would you like to change?")
  if(choice == 1){

  }
  if(choice == 2){
  cons <- menu(constellations,paste0("Change constellations to ",unique(characters$character)[char]))
  }
  if(choice == 3){}
  char <- menu(unique(characters$character),"Change character to ")
  }
  if(choice == 4){
  sty <- menu(style,title=paste0("Change style to "))
  }
  if(choice == 5){
  stat1 <- menu(stats, title="Which stat do you want to prioritise?")
  stat2 <- menu(c("Yes","No"), title="Would you like to prioritise more stats?")
    if(stat2==1){
      stat <- paste0(stat1," & ",stat2)
    }
    if(stat2==2){
      stat <- stat1
    }
  }
  if(choice == 6){

  }
  if(choice == 7){
    weap <- menu(weapons, title="Which stat do you want to prioritise?")
  }
# Example

assignweapons <- function(data) {
  char <- menu(unique(characters$character),"Pick a character: ") # add signature weapons here

}

assignartifacts <- function(mydata) {
  char <- menu(unique(characters$character),"Pick a character: ") # add recommended artifacts output here
  set <- menu(artifacts$artifacts,"Pick an artifact set: ")
  pieces <- menu(c("Yes","No"),"Would you like to run a four-piece set?")
  if(pieces=="Yes"){
    mydata[artifacts,character=unique(characters$character)[char]]=artifacts$artifacts[set]
  }
  if(pieces=="No"){
  set2 <- menu(artifacts$artifacts,"Pick a second artifact set: ")
  mydata[artifacts,character=unique(characters$character)[char]]=paste0(artifacts$artifacts[set]," & ",artifacts$artifacts[set2])
  }
}

# if you have
