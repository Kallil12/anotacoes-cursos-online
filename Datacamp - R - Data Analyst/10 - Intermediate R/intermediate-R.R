

# The social data has been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)
views <- matrix(c(linkedin, facebook), nrow = 2, byrow = TRUE)

# When does views equal 13?
views == 13

# When is views less than or equal to 14?

views <= 14
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Examine the if statement for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
}

# Write the if statement for num_views

if (num_views > 15){
  print("You are popular!")
}
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
}else{
  print("Unknown medium")
}


# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
}else{
  print("Try to be more visible!")
}
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Variables related to your last day of recordings
medium <- "LinkedIn"
num_views <- 14

# Control structure for medium
if (medium == "LinkedIn") {
  print("Showing LinkedIn information")
} else if (medium == "Facebook") {
  # Add code to print correct string when condition is TRUE
  print("Showing Facebook information")
} else {
  print("Unknown medium")
}

# Control structure for num_views
if (num_views > 15) {
  print("You're popular!")
} else if (num_views <= 15 & num_views > 10) {
  # Add code to print correct string when condition is TRUE
  print("Your number of views is average")
} else {
  print("Try to be more visible!")
}


# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Variables related to your last day of recordings
li <- 15
fb <- 9

# Code the control-flow construct
if (li > 15 & fb > 15) {
  sms <- 2 * (li + fb)
} else if (li < 10 & fb < 10) {
  sms <- 0.5 * (li + fb)
} else {
  sms <- li+fb
}

# Print the resulting sms to the console
print(sms)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# The nyc list is already specified
nyc <- list(pop = 8405837, 
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten Island"), 
            capital = FALSE)

# Loop version 1

for(i in nyc){
  print(i)
}


# Loop version 2
for(j in 1:length(nyc)){
  print(nyc[[j]])
}
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====


# The tic-tac-toe matrix ttt has already been defined for you

# define the double for loop
for (i in 1:nrow(ttt)) {
  for (j in 1:ncol(ttt)) {
    print(paste("On row ",i," and column ",j," the board contains", ttt[i,j]))
  }
}
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# The linkedin vector has already been defined for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)

# Adapt/extend the for loop
for (li in linkedin) {
  if (li > 10) {
    print("You're popular!")
  } else {
    print("Be more visible!")
  }
  
  # Add if statement with break
  if(li > 16){
    
    print("This is ridiculous, I'm outta here!")
    break
  }
  else if(li < 5){
    print("This is too embarrassing!")
    next
  }
  
  # Add if statement with next
  
  
  print(li)
}
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====


