library(gapminder)
library(dplyr)
library(ggplot2)

# filter the year 1957
gapminder %>%
  filter(year == 1957)

# filter China in the year 2002
gapminder %>%
  filter(country == "China", year == 2002)

# sorting with arrange, by default is ascending
gapminder %>%
  arrange(gdpPercap)

gapminder %>%
  arrange(desc(gdpPercap))

# filtering then arranging
gapminder %>%
  filter(year == 2007) %>%
  arrange(desc(gdpPercap))

gapminder %>%
  filter(year == 1957) %>%
  arrange(desc(pop))

# changing stuff using mutate
gapminder %>%
  mutate(pop = pop/1000000)

# changing lifeExp to be in months
gapminder %>%
  mutate(lifeExp = lifeExp*12)

# Use mutate to create a new column called lifeExpMonths
gapminder %>%
  mutate(lifeExpMonths = lifeExp*12)

# Using ggplot
gapminder_1952 <- gapminder %>%
  filter(year == 1952)

ggplot(gapminder_1952, aes(x = pop, y = gdpPercap)) +
  geom_point()

# changing the plot to put the X in log scale, so it can
# be more readable

ggplot(gapminder_1952, aes(x = pop, y = lifeExp)) +
  geom_point() +
  scale_x_log10()

ggplot(gapminder_1952, aes(pop, gdpPercap)) +
  geom_point()+
  scale_x_log10()+
  scale_y_log10()

# using more aesthetics in the plots

ggplot(gapminder_1952, aes(pop, lifeExp,
                           color = continent)) +
  scale_x_log10()+
  geom_point()


ggplot(gapminder_1952, aes(pop, lifeExp,
                           color = continent,
                           size = gdpPercap)) +
  scale_x_log10()+
  geom_point()

# faceting, using facets to make different plots

# Scatter plot comparing pop and lifeExp, faceted by continent
ggplot(gapminder_1952, aes(pop, lifeExp))+
  geom_point()+
  facet_wrap(~continent)+
  scale_x_log10()

# Scatter plot comparing gdpPercap and lifeExp, with color representing continent
# and size representing population, faceted by year

ggplot(gapminder, aes(gdpPercap, lifeExp, color = continent, size = pop)) +
  geom_point()+
  facet_wrap(~year)+
  scale_x_log10()

# summarizing to better understand the data

gapminder %>%
  filter(year == 2007) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

# Filter for 1957 then summarize the median life expectancy
gapminder %>%
  filter(year == 1957) %>%
  summarize(medianLifeExp = median(lifeExp))

# using group_by
gapminder %>%
  group_by(year) %>%
  summarize(meanLifeExp = mean(lifeExp),
            totalPop = sum(pop))

# Find median life expectancy and maximum GDP per capita in each year
gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp),maxGdpPercap=max(gdpPercap) )

# Find median life expectancy and maximum GDP per capita in each continent in 1957
gapminder %>%
  filter(year == 1957) %>%
  group_by(continent) %>%
  summarize(medianLifeExp = median(lifeExp), maxGdpPercap = max(gdpPercap))

# creating objects to better visualize
by_year <- gapminder %>%
  group_by(year) %>%
  summarize(medianLifeExp = median(lifeExp),
            maxGdpPercap = max(gdpPercap))

# Create a scatter plot showing the change in medianLifeExp over time
ggplot(by_year, aes(year,medianLifeExp))+
  expand_limits(y = 0)+
  geom_point()

# Summarize medianGdpPercap within each continent within each year: by_year_continent
by_year_continent <- gapminder %>% group_by(year, continent) %>% summarize(medianGdpPercap = median(gdpPercap))

# Plot the change in medianGdpPercap in each continent over time
ggplot(by_year_continent, aes(year, medianGdpPercap, color = continent)) +
  geom_point()+
  expand_limits(y=0)

# Summarize the median GDP and median life expectancy per continent in 2007
by_continent_2007 <- gapminder %>%
  group_by(continent) %>%
  filter(year == 2007) %>%
  summarize(medianLifeExp = median(lifeExp), medianGdpPercap = median(gdpPercap))


# Use a scatter plot to compare the median GDP and median life expectancy
ggplot(by_continent_2007, aes(medianGdpPercap,medianLifeExp , color = continent)) +
  geom_point()
