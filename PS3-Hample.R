# Jacob Hample
# Professor Montgomery
# Applied Statistical Programming
# February 23, 2016

door <- list()
class(door) <- "door"

PlayGame <- function(door.choice) {
  random.door <- sample(1:3, 1)
  if (door.choice == random.door) {
    print("Congratulations! You've won a BRAND NEW CAR!!!")
  }
  else {
    print("Bummer, you got a goat")
  }
}