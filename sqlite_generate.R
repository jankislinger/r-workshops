require(tidyverse)
require(DBI)
require(RSQLite)

data("starwars")

sw_characters <- starwars %>% 
  select(-films, -vehicles, -starships)

sw_films <- starwars %>% 
  select(name, film = films) %>% 
  unnest(film)

sw_vehicles <- starwars %>% 
  select(name, vehicle = vehicles) %>% 
  unnest(vehicle)

sw_starships <- starwars %>% 
  select(name, starship = starships) %>% 
  unnest(starship)

con <- dbConnect(SQLite(), 'data/starwars.sqlite')
dbWriteTable(con, "sw_characters", sw_characters)
dbWriteTable(con, "sw_films", sw_films)
dbWriteTable(con, "sw_vehicles", sw_vehicles)
dbWriteTable(con, "sw_starships", sw_starships)

dbDisconnect(con)

