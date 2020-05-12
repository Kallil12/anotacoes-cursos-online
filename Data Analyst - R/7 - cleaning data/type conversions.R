# Make this evaluate to "character"
class("TRUE")

# Make this evaluate to "numeric"
class(8484.00)

# Make this evaluate to "integer"
class(99L)

# Make this evaluate to "factor"
class(factor("factor"))

# Make this evaluate to "logical"
class(FALSE)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Preview students with str()
str(students)

# Coerce Grades to character
students$Grades <- as.character(students$Grades)

# Coerce Medu to factor
students$Medu <- as.factor(students$Medu)

# Coerce Fedu to factor
students$Fedu <- as.factor(students$Fedu)

# Look at students once more with str()
str(students)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
install.packages("lubridate")
library(lubridate)

# Preview students2 with str()
str(students2)

# Load the lubridate package
library(lubridate)

# Parse as date
dmy("17 Sep 2015")

# Parse as date and time (with no seconds!)
mdy_hm("July 15, 2012 12:56")

# Coerce dob to a date (with no time)
students2$dob <- ymd(students2$dob)

# Coerce nurse_visit to a date and time
students2$nurse_visit <- ymd_hms(students2$nurse_visit)

# Look at students2 once more with str()
str(students2)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# stringr library
# Load the stringr package
library(stringr)

# Trim all leading and trailing whitespace
limpe <- c("   Filip ", "Nick  ", " Jonathan")
str_trim(limpe)
# Pad these strings with leading zeros
ponhaZeros <- c("23485W", "8823453Q", "994Z")
str_pad(ponhaZeros, width = 9, side = "left", pad = "0")

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Print state abbreviations
states

# Make states all uppercase and save result to states_upper
states_upper <- toupper(states)

# Make states_upper all lowercase again
states <- tolower(states_upper)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Copy of students2: students3
students3 <- students2

# Look at the head of students3
head(students3)

# Detect all dates of birth (dob) in 1997
str_detect(c(students3$dob), "1997")

# In the sex column, replace "F" with "Female" ...
students3$sex <- str_replace(students3$sex, "F", "Female")

# ... and "M" with "Male"
students3$sex <- str_replace(students3$sex, "M", "Male")

# View the head of students3
head(students3)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Call is.na() on the full social_df to spot all NAs
is.na(social_df)

# Use the any() function to ask whether there are any NAs in the data
any(is.na(social_df))

# View a summary() of the dataset
summary(social_df)

# Call table() on the status column
table(social_df$status)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Replace all empty strings in status with NA
social_df$status[social_df$status == ""] <- NA

# Print social_df to the console
social_df

# Use complete.cases() to see which rows have no missing values
complete.cases(social_df)

# Use na.omit() to remove all rows with any missing values
na.omit(social_df)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Look at a summary() of students3
summary(students3)

# View a histogram of the age variable
hist(students3$age)

# View a histogram of the absences variable
hist(students3$absences)

# View a histogram of absences, but force zeros to be bucketed to the right of zero
hist(students3$absences, right = FALSE)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# View a boxplot of age
boxplot(students3$age)

# View a boxplot of absences
boxplot(students3$absences)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====