babynames %>%
  # Filter for the year 1990
  filter(year == 1990) %>%
  # Sort the number column in descending order 
  arrange(desc(number))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Find the most common name in each year
babynames %>%
  group_by(year) %>%
  top_n(1,number)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Filter for the names Steven, Thomas, and Matthew 
selected_names <- babynames %>%
  filter(name %in% c("Steven", "Thomas", "Matthew"))

# Plot the names using a different color for each name
ggplot(selected_names, aes(x = year, y = number, color = name)) +
  geom_line()
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Find the year each name is most common 
babynames %>%
  group_by(year) %>%
  mutate(year_total = sum(number) ) %>%
  ungroup() %>%
  mutate(fraction = number / year_total) %>%
  group_by(name) %>%
  top_n(1, fraction)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Add columns name_total and name_max for each name
babynames %>%
  group_by(name) %>%
  mutate(name_total = sum(number),
         name_max = max(number))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
babynames %>%
  group_by(name) %>%
  mutate(name_total = sum(number),
         name_max = max(number)) %>%
  # Ungroup the table 
  ungroup() %>%
  # Add the fraction_max column containing the number by the name maximum 
  mutate(fraction_max = number/name_max)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====





# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
