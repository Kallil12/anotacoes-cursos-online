# understand the structure of the data, use:
# class() - to check which is the class of the object
# dim() - to check the data dimensions
# names() - to see the column names, it helps to understand what exactly the data mean
# str() - to preview the structure or
# glimplse() - which is a slightly better version of str()
# summary() - well, the name is pretty obvious

# after that, look at the data

# head() and tail() are very important in this step

# visualize the data with hist() and plot()
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Verify that weather is a data.frame
class(weather)

# Check the dimensions
dim(weather)

# View the column names
names(weather)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# View the structure of the data
str(weather)

# Load dplyr package
library(dplyr)

# Look at the structure using dplyr's glimpse()
glimpse(weather)

# View a summary of the data
summary(weather)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# View first 6 rows
head(weather)

# View first 15 rows
head(weather, n = 15)

# View the last 6 rows
tail(weather)

# View the last 10 rows
tail(weather, n = 10)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Load the tidyr package
library(tidyr)

# Gather the columns
weather2 <- gather(weather,day,value,X1:X31, na.rm = TRUE)

# View the head
head(weather2)
#columns from X1 to X31 became day and (temperature) value

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# First remove column of row names
without_x <- weather2[, -1]

# Spread the data
weather3 <- spread(without_x,measure, value)

# View the head
head(weather3)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Load the stringr and lubridate packages
library(stringr)
library(lubridate)

# Remove X's from day column
weather3$day <- str_replace(weather3$day,"X", "")

# Unite the year, month, and day columns
weather4 <- unite(weather3, date, year, month, day, sep = "-")

# Convert date column to proper date format using lubridates's ymd()
weather4$date <- ymd(weather4$date)

# Rearrange columns using dplyr's select()
weather5 <- select(weather4, date, Events, CloudCover:WindDirDegrees)

# View the head of weather5
head(weather5)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# View the structure of weather5
str(weather5)

# Examine the first 20 rows of weather5. Are most of the characters numeric?
head(weather5, n = 20)

# See what happens if we try to convert PrecipitationIn to numeric
as.numeric(weather5$PrecipitationIn)

# in the process of converting the data to numeric, some of the data is a character,
# so it became NA because R doesnt know what number a character should be

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Replace "T" with "0" (T = trace)
# T is trace, too small to be measured
weather5$PrecipitationIn <- str_replace(weather5$PrecipitationIn, "T", "0")

# Convert characters to numerics
weather6 <- mutate_at(weather5, vars(CloudCover:WindDirDegrees), funs(as.numeric))

# Look at result
str(weather6)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# missing, extreme and unexpected values
# Count missing values
sum(is.na(weather6))

# Find missing values
summary(weather6)

# Find indices of NAs in Max.Gust.SpeedMPH
ind <- which(is.na(weather6$Max.Gust.SpeedMPH))

# Look at the full rows for records missing Max.Gust.SpeedMPH
weather6[ind, ]
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Review distributions for all variables
summary(weather6)

# Find row with Max.Humidity of 1000
ind <- which(weather6$Max.Humidity == 1000)

# Look at the data for that day
weather6[ind, ]

# Change 1000 to 100
weather6$Max.Humidity[ind] <- 100

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Look at summary of Mean.VisibilityMiles
summary(weather6$Mean.VisibilityMiles)

# Get index of row with -1 value
ind <- which(weather6$Mean.VisibilityMiles == -1)

# Look at full row
weather6[ind,]

# Set Mean.VisibilityMiles to the appropriate value
weather6$Mean.VisibilityMiles[ind] <- 10

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Review summary of full data once more
summary(weather6)

# Look at histogram for MeanDew.PointF
hist(weather6$MeanDew.PointF)

# Look at histogram for Min.TemperatureF
hist(weather6$Min.TemperatureF)

# Compare to histogram for Mean.TemperatureF
hist(weather6$Mean.TemperatureF)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Clean up column names
names(weather6) <- new_colnames

# Replace empty cells in events column
weather6$events[weather6$events == ""] <- "None"

# Print the first 6 rows of weather6
head(weather6)