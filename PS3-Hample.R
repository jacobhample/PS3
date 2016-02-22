# Jacob Hample
# Professor Montgomery
# Applied Statistical Programming
# February 23, 2016

## S3 ##

# S3 function that simulates the gameshow "Let's Make a Deal"
# 
# The function PlayGame takes in a numeric 1, 2, or 3, compares that choice
# to a randomly generated door value which indicates the location of the car,
# then informs the player if they've selected the door with the car or one
# with a goat
# 
# @param random.door A random number from 1-3
# @param possible doors A vector representing the possible door choices
# 
# @return A message indicating whether the player has received a car or goat
# 
# @author Jacob Hample


# Creates a new class called 'door'
door <- list()
class(door) <- "door"

# Creates function 'PlayGame'
PlayGame <- function(door.choice) {
  random.door <- sample(1:3, 1)
  possible.doors <- 1:3
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