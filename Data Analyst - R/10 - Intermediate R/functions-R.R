# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate average number of views

avg_li <- mean(linkedin)
avg_fb <- mean(facebook)

# Inspect avg_li and avg_fb
avg_li
avg_fb
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
facebook <- c(17, 7, 5, 16, 8, 13, 14)

# Calculate the mean of the sum
avg_sum <- mean(linkedin + facebook)

# Calculate the trimmed mean of the sum
avg_sum_trimmed <- mean(linkedin + facebook, trim = 0.2)

# Inspect both new variables

avg_sum_trimmed
avg_sum

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# The linkedin and facebook vectors have already been created for you
linkedin <- c(16, 9, 13, 5, NA, 17, 14)
facebook <- c(17, NA, 5, 16, 8, 13, 14)

# Calculate the mean absolute deviation
mean(abs(linkedin-facebook), na.rm = TRUE)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Create a function pow_two()
pow_two <- function(x){
  x*x
}
# Use the function
pow_two(12)

# Create a function sum_abs()
sum_abs <- function(x,y){
  if(x < 0){
    x <- -1 * x
  }
  if(y < 0){
    y <- -1 * y
  }
  x+y
}


# Use the function
sum_abs(-2,3)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Define the function hello()
hello <- function(){
  print("Hi there!")
  TRUE
}




# Call the function hello()
hello()
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Finish the pow_two() function
pow_two <- function(x, print_info = TRUE) {
  y <- x ^ 2
  if(print_info == TRUE){
    print(paste(x, "to the power two equals", y))
  }
  return(y)
}
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

search()

