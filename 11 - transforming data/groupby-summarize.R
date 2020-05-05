# Summarize to find minimum population, maximum unemployment, and average income
counties_selected %>%
  summarize(min_population = min(population), 
            max_unemployment = max(unemployment), 
            average_income = mean(income))

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Add a density column, then sort in descending order
counties_selected %>%
  group_by(state) %>%
  summarize(total_area = sum(land_area),
            total_population = sum(population)) 
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Add a density column, then sort in descending order
counties_selected %>%
  group_by(state) %>%
  summarize(total_area = sum(land_area),
            total_population = sum(population)) %>%
  mutate(density = total_population/total_area) %>%
  arrange(desc(density))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Summarize to find the total population
counties_selected %>%
  group_by(region,state) %>%
  summarize(total_pop = sum(population))

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Calculate the average_pop and median_pop columns 
counties_selected %>%
  group_by(region, state) %>%
  summarize(total_pop = sum(population)) %>% 
  summarize(average_pop = mean(total_pop), median_pop = median(total_pop) ) 

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Group by region and find the greatest number of citizens who walk to work
counties_selected %>%
  group_by(region) %>%
  top_n(1, walk)


# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

counties_selected %>%
  group_by(region, state) %>%
  # Calculate average income
  summarize(average_income = mean(income) )%>%
  # Find the highest income state in each region
  top_n(1, average_income)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Find the total population for each combination of state and metro
counties_selected %>%
  group_by(state, metro) %>%
  summarize(total_pop = sum(population) )

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

# Count the states with more people in Metro or Nonmetro areas
counties_selected %>%
  group_by(state, metro) %>%
  summarize(total_pop = sum(population)) %>%
  top_n(1, total_pop) %>%
  ungroup() %>%
  count(metro)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====