# Jacob Hample
# Professor Montgomery
# Applied Statistical Programming
# February 25, 2016

## S3 ##

# S3 function that simulates the gameshow "Let's Make a Deal"
# 
# The function PlayGame takes in an object of class 'door' (in this case the
# number 1, 2, or 3), compares that choice to a randomly generated door value
# which indicates the location of the car, then informs the player if they've
# selected the door with the car or one with a goat.
# 
# @param doors An object of class 'door' composed of a random number 1-3
# @param possible doors A vector representing the possible door choices
# 
# @return A message indicating whether the player has received a car or goat
# 
# @author Jacob Hample

# Creates object of class 'door'
doors <- structure(sample(1:3, 1), class = "door")
possible.doors <- 1:3

# Creates generic function 'Playgame'
PlayGame <- function(door.choice) {
  UseMethod("PlayGame")
}

# Tells Playgame what to with door objects
PlayGame.door <- function(door.choice) {
  random.door <- sample(1:3, 1)
  if (door.choice == random.door) {
    print("Congratulations! You've won a BRAND NEW CAR!!!")
  }
  else if (door.choice %in% possible.doors == FALSE) {
    print("You did not select a possible door. Please select door 1, 2, or 3.")
  }
  else {
    print("Bummer, you got a goat")
  }
}


## S4 ##

# S4 function that simulates the gameshow "Let's Make a Deal"
# 
# The function PlayGame.S4 takes in an object of class 'door' through the
# choice of the Chooser function (in this case a random number 1-3), compares
# that choice to a randomly generated door value which indicates the location of
# the car, then informs the player if they've selected the door with the car or
# one with a goat.
# 
# @param possible doors A vector representing the possible door choices
# @function Chooser A function that chooses a random door 1-3
#
# @return A message indicating whether the player has received a car or goat
# 
# @author Jacob Hample

# Creaates new class called 'door'
setClass("door", slots = list(door.choice = "numeric"))
possible.doors <- 1:3

# Creates a funtion that chooses a random door 1-3
Chooser <- function(door.choice){
  new.door <- new("door", door.choice = sample(1:3,1))
  return(new.door)
}

# Sets the genric for PlayGame.S4
setGeneric("PlayGame.S4", function(x) {
  standardGeneric("PlayGame.S4")
})

# Sets the method for PlayGame.S4
setMethod("PlayGame.S4", c(x="door"),
          function(x) {
            random.door <- sample(1:3, 1)
            if (x@door.choice == random.door) {
              print("Congratulations! You've won a BRAND NEW CAR!!!")
            }
            else if (x@door.choice %in% possible.doors == FALSE) {
              print("You did not select a possible door. Please select door 1, 2, or 3.")
            }
            else {
              print("Bummer, you got a goat")
            }
          })

# Tests the system
PlayGame.S4(Chooser())
