# require(ggplot2)
require(tidyverse)

theme_set(theme_bw())

data("starwars")
starwars


# ggplot(data, aesthetics)
starwars %>% 
  filter(!is.na(height), !is.na(mass)) %>% 
  ggplot(aes(x = height, y = mass)) +
  geom_line(na.rm=T)

# plot points
ggplot(starwars, aes(height, mass)) +
  geom_point()

# size and color by other vars
ggplot(starwars, aes(height, mass, color = homeworld, size = birth_year)) +
  geom_point()

# add lines by gender
ggplot(starwars, aes(height, mass, color = gender, size = birth_year)) +
  geom_point(na.rm = F, show.legend = F) +
  geom_line()

# color and size locally for points only
ggplot(starwars, aes(height, mass)) +
  geom_point(aes(color = gender, size = birth_year), na.rm = T, show.legend = F) +
  geom_line(na.rm = T)

# all aes as local
starwars %>% 
  mutate(size = ifelse(name == 'Luke Skywalker', 10000, 5)) %>% 
  ggplot() +
  geom_point(aes(height, mass, color = gender, size = size), na.rm = T, show.legend = F) +
  geom_line(aes(height, mass), na.rm = T, color = 'gray', alpha = 0.5)
# color, size, alpha, ... - both in aes and geom_

ggplot(starwars, aes(height, mass)) +
  geom_point(aes(color = gender, size = birth_year),
             na.rm = T, show.legend = F, shape = 17) +
  geom_line(aes(linetype = gender))

ggplot(starwars, aes(height, mass, linetype = gender)) +
  geom_point(aes(color = gender, size = birth_year),
             na.rm = T, show.legend = F, shape = 17) +
  ggtitle("Main title", "Subtitle") +
  # scale_y_log10() +
  # scale_colour_manual(values = c(female = 'red', male = 'blue',
  #                                hermaphrodite = 'black', none = 'black')) +
  coord_flip()
  # expand_limits(x = c(0, 500), y = c(1)) +
  # facet_grid(gender ~ hair_color)


starwars %>% count(gender)


require(plotly)
ggplotly()
