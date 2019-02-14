# require(magrittr)
require(dplyr)
# require(tidyverse)



# select ------------------------------------------------------------------

select(cameras, lat, long)
select(cameras, starts_with('name'))
select(cameras, -externalid)
select(cameras, externalid:long)

select(cameras, externalid, everything())
select(cameras, everything())

select(cameras, one_of('name'))
select(cameras, lat, long, one_of('name2'))
select(cameras, lat, long, name2)


# filter ------------------------------------------------------------------

cameras
filter(cameras, lat > 50.05, long < 14.5)
filter(cameras, lat > 50.05 & long < 14.5)
filter(cameras, lat > 50.05 | long < 14.5, !is.na(externalid))


# arrange -----------------------------------------------------------------

arrange(cameras, name)
arrange(cameras, desc(name))
arrange(cameras, round(lat, 1), long)
arrange(cameras, round(lat, 1), -long)
arrange(cameras, round(lat, 1), desc(long))


# mutate ------------------------------------------------------------------

mutate(cameras, dist = abs(50 - lat) + abs(14 - long), lat2 = lat^2)
mutate(cameras,
       a = ifelse(lat > 50.1, lat, 50.1),
       b = pmax(lat, 50.1))

mutate(cameras, lat = pmax(lat, 51))

transmute(cameras,
          a = ifelse(lat > 50.1, lat, 50.1),
          b = pmax(lat, 50.1),
          lat = lat)

cameras


# summarise ---------------------------------------------------------------

summarise(cameras, mean_lat = mean(lat), mean_long = mean(long), count = n(),
          a = var(lat + long), num_names = n_distinct(name))


# pipes -------------------------------------------------------------------
log(10)
10 %>% log()
10 %>% log

log(10, base = 8)
10 %>% log(base=8)
8 %>% log(x=10)
log(8, x = 10)
8 %>% log(10, .)

10 %>% log(base = 8) %>% sqrt()
sqrt(log(10, base = 8))


cameras %>% 
  arrange(round(lat, 1), -long) %>% 
  filter(long < 14.5) %>%
  select(name, externalid)

select(filter(arrange(cameras, round(lat, 1), -long), long < 14.5), name, externalid)
