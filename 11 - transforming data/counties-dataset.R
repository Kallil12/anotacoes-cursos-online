
# Select the columns 
counties %>%
  select(state, county, population, poverty)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
counties_selected <- counties %>%
  select(state, county, population, private_work, public_work, self_employed)

# Add a verb to sort in descending order of public_work
counties_selected %>%
  arrange(desc(public_work))

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
counties_selected <- counties %>%
  select(state, county, population)

# Filter for counties with a population above 1000000
counties_selected %>%
  filter(population > 1000000)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
counties_selected <- counties %>%
  select(state, county, population)

# Filter for counties in the state of California that have a population above 1000000
counties_selected %>%
  filter(state == "California" & population > 1000000)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

counties_selected <- counties %>%
  select(state, county, population, private_work, public_work, self_employed)

# Filter for Texas and more than 10000 people; sort in descending order of private_work
counties_selected %>%
  filter(state == "Texas" & population > 10000) %>%
  arrange(desc(private_work))

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# mutate create a new variable, in a dataset it will create a new column

counties_selected <- counties %>%
  select(state, county, population, public_work)

# Add a new column public_workers with the number of people employed in public work
counties_selected %>%
  mutate(public_workers = population*public_work/100)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
counties_selected <- counties %>%
  select(state, county, population, public_work)

# Sort in descending order of the public_workers column
counties_selected %>%
  mutate(public_workers = public_work * population / 100) %>%
  arrange(desc(public_workers))
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Select the columns state, county, population, men, and women
counties_selected <- counties %>%
  select(county, state, population, men, women)

# Calculate proportion_women as the fraction of the population made up of women
counties_selected %>% 
  mutate(proportion_women = women/population)

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
counties %>%
  # Select the five columns 
  select(state, county, population, men, women) %>%
  # Add the proportion_men variable
  mutate(proportion_men = men/population) %>%
  # Filter for population of at least 10,000
  filter(population >= 10000) %>%
  # Arrange proportion of men in descending order 
  arrange(desc(proportion_men))


# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Use count to find the number of counties in each region
counties_selected %>%
  count(region, sort = TRUE)
# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
# Find number of counties per state, weighted by citizens
counties_selected %>%
  count(state, wt = citizens, sort = TRUE )

# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====

counties_selected %>%
  # Add population_walk containing the total number of people who walk to work 
  mutate(population_walk = population*walk/100) %>%
  # Count weighted by the new column
  count(state,wt = population_walk, sort = TRUE)


# ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//==== ====//====
