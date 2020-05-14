# Summarize the median gdpPercap by year, then save it as by_year

by_year <- gapminder %>% group_by(year) %>% summarize(medianGdpPercap = median(gdpPercap))
# Create a line plot showing the change in medianGdpPercap over time

ggplot(by_year, aes(year, medianGdpPercap))+
  geom_line()+
  expand_limits(y = 0)

# Summarize the median gdpPercap by year & continent, save as by_year_continent
by_year_continent <- gapminder %>%
  group_by(year, continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Create a line plot showing the change in medianGdpPercap by continent over time

ggplot(by_year_continent, aes(year, medianGdpPercap, color = continent))+
  geom_line()+
  expand_limits(y=0)

library(gapminder)
library(dplyr)
library(ggplot2)

# Summarize the median gdpPercap by continent in 1952
by_continent <- gapminder %>%
  filter(year == 1952) %>%
  group_by(continent) %>%
  summarize(medianGdpPercap = median(gdpPercap))

# Create a bar plot showing medianGdp by continent

ggplot(by_continent, aes(continent, medianGdpPercap)) + 
  geom_col()

library(gapminder)
library(dplyr)
library(ggplot2)

# Filter for observations in the Oceania continent in 1952

oceania_1952 <- gapminder %>% 
  filter(year == 1952, continent == "Oceania")
# Create a bar plot of gdpPercap by country

ggplot(oceania_1952, aes(country, gdpPercap))+
  geom_col()

library(gapminder)
library(dplyr)
library(ggplot2)

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a histogram of population (pop), with x on a log scale

ggplot(gapminder_1952, aes(pop))+
  scale_x_log10()+
  geom_histogram()

library(gapminder)
library(dplyr)
library(ggplot2)

gapminder_1952 <- gapminder %>%
  filter(year == 1952)

# Create a boxplot comparing gdpPercap among continents
ggplot(gapminder_1952, aes(continent, gdpPercap))+
  scale_y_log10()+
  geom_boxplot()