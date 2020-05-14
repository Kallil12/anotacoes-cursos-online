library(dplyr)
library(ggplot2)
netflix_data <- read.csv("netflix_titles.csv")

str(netflix_data)
head(netflix_data)

summary(netflix_data)

netflix_brasil <- netflix_data %>%
  filter(country == "Brazil")

head(netflix_brasil)

netflix_brasil_tipo <- netflix_data %>%
  filter(country == "Brazil") %>%
  group_by(type)

ggplot(netflix_brasil_tipo, aes(release_year,director))+
  geom_point()