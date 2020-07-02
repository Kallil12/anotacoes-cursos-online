# Subset of emails with big numbers: email50_big
email50_big <- email50 %>%
  filter(number == "big")

# Table of the number variable
table(email50_big$number)

# Drop levels
email50_big$number_dropped <- droplevels(email50$number)

# Table of the number_dropped variable
table(email50_big$number_dropped)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Subset of emails with big numbers: email50_big
email50_big <- email50 %>%
  filter(number == "big")

# Table of the number variable
table(email50_big$number)

# Drop levels
email50_big$number_dropped <- droplevels(email50_big$number)

# Table of the number_dropped variable
table(email50_big$number_dropped)

# drop the levels thare are not used
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Discretize a variable

# Calculate median number of characters: med_num_char
med_num_char <- median(email50$num_char)

# Create num_char_cat variable in email50
email50_fortified <- email50 %>%
  mutate(num_char_cat = ifelse(num_char < med_num_char, "below median", "at or above median"))

# Count emails in each category
email50_fortified %>%
  count(num_char_cat)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Create number_yn column in email50
email50_fortified <- email50 %>%
  mutate(
    number_yn = case_when(
      # if number is "none", make number_yn "no"
      number == "none" ~ "no", 
      # if number is not "none", make number_yn "yes"
      number != "none" ~ "yes"  
    )
  )


# Visualize the distribution of number_yn
ggplot(email50_fortified, aes(x = number_yn)) +
  geom_bar()
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Load ggplot2
library(ggplot2)

# Scatterplot of exclaim_mess vs. num_char
ggplot(email50, aes(x = num_char, y = exclaim_mess, color = factor(spam))) +
  geom_point()
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====