require(tidyverse)

data('starwars')
starwars


# summarise ---------------------------------------------------------------

mean <- purrr::partial(mean, na.rm=T)

na.rm <- T

starwars %>%
  mutate(is_from_alderaan = homeworld == "Alderaan") %>% 
  # filter(is.na(homeworld)) %>%
  # select(name, homeworld, is_from_alderaan)
  summarise(
    mean_mass = mean(mass, na.rm=na.rm),
    num_alderaan = sum(is_from_alderaan, na.rm=na.rm),
    ratio_humans = sum(species == 'Human', na.rm = na.rm) / n()
  )


# BMI ---------------------------------------------------------------------

mutate(starwars, bmi = mass/height^2)

starwars %>%
  filter(hair_color = 'blond') %>% 
  mutate(bmi = mass / (height / 100)^2) %>%
  select(name, height, mass, bmi) %>% 
  arrange(desc(bmi))


# the force awakens -------------------------------------------------------

starwars %>% 
  select(films)

starwars %>% pull(films)
starwars$films # the same

starwars$films[[1]]

map_lgl(starwars$films, ~ "The Force Awakens" %in% .x)
map_int(starwars$vehicles, length)

starwars %>% 
  # filter(name == 'Luke Skywalker') %>% 
  filter(map_lgl(films, ~ "The Force Awakens" %in% .x))

starwars %>% 
  mutate(is_in_tfa = map_lgl(films, ~ "The Force Awakens" %in% .x)) %>% 
  filter(is_in_tfa) %>% 
  mutate(num_vehicles = map_int(vehicles, length),
         num_starships = map_int(starships, length),
         num_mot = num_vehicles + num_starships) %>% 
  select(name, num_mot) %>% 
  arrange(desc(num_mot))


