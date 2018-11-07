require(tidyverse)

data("starwars")
starwars

%>% # ctrl + shift + m

starwars %>% 
  filter(!is.na(mass)) %>% 
  summarise(mean_mass = mean(mass, na.rm = TRUE),
            num_aleraan = sum(homeworld == 'Alderaan', na.rm = TRUE),
            hum_ratio_1 = sum(species == 'Human', na.rm = T) / length(species) * 100,
            hum_ratio_2 = sum(species == 'Human', na.rm = T) / nrow(.) * 100,
            hum_ratio_3 = sum(species == 'Human', na.rm = T) / n() * 100,
            hum_ratio_4 = sum(species == 'Human', na.rm = T) / sum(!is.na(species)) * 100,
            hum_ratio_5 = mean(species == 'Human', na.rm = T) * 100)


homeworld <- c('Alderaan', 'Earth', NA)
homeworld == 'Alderaan'
sum(homeworld == 'Alderaan', na.rm = TRUE)



# task 2 ------------------------------------------------------------------


"The Force Awakens" %in% starwars$films[[1]]

map_lgl(starwars$films, ~"The Force Awakens" %in% .x)


length(starwars$vehicles[[3]])
map_int(starwars$vehicles, ~length(.x))
map_int(starwars$vehicles, length)


starwars %>% 
  filter(map_lgl(films, ~"The Force Awakens" %in% .x)) %>% 
  mutate(num_vehicles = map_int(vehicles, length),
         num_starships = map_int(starships, length),
         num_means_of_trans = num_vehicles + num_starships) %>% 
  select(name, num_means_of_trans) %>% 
  arrange(desc(num_means_of_trans))
