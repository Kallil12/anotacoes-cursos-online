# Check the class of bmi
class(bmi)

# Check the dimensions of bmi
dim(bmi)

# View the column names of bmi
names(bmi)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Check the structure of bmi
str(bmi)

# Load dplyr
library(dplyr)

# Check the structure of bmi, the dplyr way
glimpse(bmi)

# View a summary of bmi
summary(bmi)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Print bmi to the console
print(bmi)

# View the first 6 rows
head(bmi)

# View the first 15 rows
head(bmi,15)

# View the last 6 rows
tail(bmi)

# View the last 10 rows
tail(bmi, n = 10)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Histogram of BMIs from 2008
hist(bmi$Y2008)

# Scatter plot comparing BMIs from 1980 to those from 2008
plot(bmi$Y1998, bmi$Y2008)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Histogram of BMIs from 2008
hist(bmi$Y2008)

# Scatter plot comparing BMIs from 1980 to those from 2008
plot(bmi$Y1980,bmi$Y2008)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Apply gather() to bmi and save the result as bmi_long
bmi_long <- gather(bmi, year, bmi_val, -Country)

# View the first 20 rows of the result
head(bmi_long,20)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Reverse what was done above
# Apply spread() to bmi_long
bmi_wide <- spread(bmi_long, year, bmi_val)

# View the head of bmi_wide
head(bmi_wide)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Apply separate() to bmi_cc
bmi_cc_clean <- separate(bmi_cc, col = Country_ISO, into = c("Country", "ISO"), sep = "/")

# Print the head of the result
head(bmi_cc_clean)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Apply unite() to bmi_cc_clean
bmi_cc <- unite(bmi_cc_clean, Country_ISO, Country, ISO, sep = "-")

# View the head of the result
head(bmi_cc)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# View the head of census
head(census)

# Gather the month columns
census2 <-  gather(census, month, amount, -YEAR)

# Arrange rows by YEAR using dplyr's arrange
census2_arr <- arrange(census2,YEAR)

# View first 20 rows of census2_arr
head(census2_arr,20)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# View first 50 rows of census_long
head(census_long, 50)

# Spread the type column
census_long2 <- spread(census_long, type, amount)

# View first 20 rows of census_long2
head(census_long2, 20)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# View the head of census_long3
head(census_long3)

# Separate the yr_month column into two
census_long4 <- separate(census_long3, col = yr_month, into = c("year", "month"))

# View the first 6 rows of the result
head(census_long4)































