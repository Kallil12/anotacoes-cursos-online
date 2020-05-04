# apply a function in all elements within a list

# The vector pioneers has already been created for you
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")

# Split names from birth year
split_math <- strsplit(pioneers, split = ":")

# Convert to lowercase strings: split_low
split_low <- lapply(split_math, tolower)

# Take a look at the structure of split_low
str(split_low)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Code from previous exercise:
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Write function select_first()
select_first <- function(x) {
  x[1]
}

# Apply select_first() over split_low: names
names <- lapply(split_low, select_first)

# Write function select_second()
select_second <- function(x){
  x[2]
}

# Apply select_second() over split_low: years

years <- lapply(split_low, select_second)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# split_low has been created for you
split_low

# Transform: use anonymous function inside lapply

names <- lapply(split_low, function(x){x[1]})

# Transform: use anonymous function inside lapply

years <- lapply(split_low, function(x){x[2]})
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Definition of split_low
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- strsplit(pioneers, split = ":")
split_low <- lapply(split, tolower)

# Generic select function
select_el <- function(x, index) {
  x[index]
}

# Use lapply() twice on split_low: names and years
names <- lapply(split_low, select_el, index = 1)
years <- lapply(split_low, select_el, index = 2)


# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# sapply - named vector

# temp is already prepared for you in the workspace

# Definition of below_zero()
below_zero <- function(x) {
  return(x[x < 0])
}

# Apply below_zero over temp using sapply(): freezing_s
freezing_s <- sapply(temp, below_zero)

# Apply below_zero over temp using lapply(): freezing_l
freezing_l <- lapply(temp, below_zero)

# Are freezing_s and freezing_l identical?

identical(freezing_l, freezing_s)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# temp is already available in the workspace

# Definition of the basics() function
basics <- function(x) {
  c(min = min(x), mean = mean(x), median = median(x), max = max(x))
}

# Fix the error:
vapply(temp, basics, numeric(4))


# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# The linkedin and facebook lists have already been created for you
linkedin <- list(16, 9, 13, 5, 2, 17, 14)
facebook <- list(17, 7, 5, 16, 8, 13, 14)

# Convert linkedin and facebook to a vector: li_vec and fb_vec
li_vec <- as.vector(linkedin)
fb_vec <- as.vector(facebook)

# Append fb_vec to li_vec: social_vec
social_vec <- append(li_vec, fb_vec)

# Sort social_vec
sort(unlist(social_vec), decreasing = TRUE)


# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====