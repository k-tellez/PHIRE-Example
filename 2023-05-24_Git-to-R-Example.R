# Author: Katelen Tellez
# Email: ktellez@arizona.edu
# Created: 2023-05-24
# Updated: 2023-05-24
# Description: Intro to ggplot2


# Section Shortcut --------------------------------------------------------
# Ctrl + Shift + R


# Comment out chunks of code ----------------------------------------------
# Ctrl + Shift + C

# Libraries ---------------------------------------------------------------

# install packages: install.packages( c("dplyr", "ggplot", "tidyr") )
library(ggplot2)
library(dplyr)
library(tidyr)
library(gapminder)


# Making a visualization --------------------------------------------------

gapminder <- gapminder

# Continuous (GDP)
# Note: alpha sets opacity of points, ranges from 0 - 1
# Note: geom_smooth() creates best fit line, "lm" is for linear regression model
ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(alpha = 0.5, color = "purple") +
  scale_x_log10() +
  geom_smooth(method = "lm", linewidth = 3)

# Categorical (year)
ggplot(gapminder, 
       aes(x = year, y = lifeExp, group = country)) + 
  geom_point() +
  geom_line(aes(color = continent))

# Visualize Americas only
gapminder %>% # ctrl+shift+m for pipe
  filter(continent == "Americas")

americas <- gapminder %>% # ctrl+shift+m for pipe
  filter(continent == "Americas")

# Plot Americas
# Note: facet_wrap(~columnName) creates separate graphs on plot
ggplot(americas, 
       aes(x = year, y = lifeExp, group = country)) + 
  geom_line() +
  facet_wrap(~country) +
  labs( x = "Year",
        y = "Life Expectancy", 
        title = "Title")

# same thing as above
americas %>% 
ggplot(aes(x = year, y = lifeExp, group = country)) + 
  geom_line() +
  facet_wrap(~country) +
  labs( x = "Year",
        y = "Life Expectancy", 
        title = "Title")

# same thing as both above examples
gapminder %>% 
  filter(continent == "Americas") %>% 
ggplot(aes(x = year, y = lifeExp, group = country)) + 
  geom_line() +
  facet_wrap(~country) +
  labs( x = "Year",
        y = "Life Expectancy", 
        title = "Title")

