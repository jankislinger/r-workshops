require(tidyverse)
require(datasets)


# iris --------------------------------------------------------------------

data("iris")

iris
iris <- as_data_frame(iris)
colnames(iris) <- c("sepal_length", "sepal_width", "petal_length", "petal_width", "species")
iris

View(iris)


# quick comparison of base vs tidyverse
iris[iris$species == 'setosa', endsWith(colnames(iris), 'width')]  # from 101-console.R
iris %>% 
  filter(species == 'setosa') %>% 
  select(ends_with('width'))


# select ------------------------------------------------------------------

?select

select(iris, petal_width, sepal_length)
select(iris, petal_width:sepal_length)
select(iris, 1:3)
select(iris, starts_with('Sepal'))

select(iris, everything())
select(iris, species, everything())  # real pain in base R


# filter ------------------------------------------------------------------

?filter

filter(iris, species == 'setosa')
filter(iris, sepal_length >= 5)
filter(iris, species == 'setosa', sepal_length >= 5)   # AND
filter(iris, species == 'setosa' & sepal_length >= 5)  # AND, but use comma instead
filter(iris, species == 'setosa' | sepal_length >= 5)  # OR


# arrange -----------------------------------------------------------------

?arrange

arrange(iris, petal_width)
arrange(iris, petal_width, petal_length)

arrange(iris, desc(petal_width))
arrange(iris, -petal_width)
arrange(iris, desc(petal_width), petal_length)

arrange(iris, species)
arrange(iris, desc(species))
arrange(iris, -species)  # fails


# mutate ------------------------------------------------------------------

?mutate

mutate(iris, Sepal.Ratio = sepal_width / sepal_length)
mutate(iris, Sepal.Ratio = sepal_width / sepal_length, Petal.Ratio = petal_width / petal_length)
mutate(iris, one = 1)
mutate(iris, id = seq_len(n()))

mutate(iris, sepal_length = as.integer(sepal_length * 10))
mutate(iris, species = toupper(species))

transmute(iris, sepal_ratio = sepal_width / sepal_length, petal_ratio = petal_width / petal_length)

# several other functions - not into details today
mutate_at(iris, vars(1:4), funs(as.integer(. * 10)))
mutate_if(iris, is.numeric, funs(as.integer(. * 10)))
mutate_if(iris, is.factor, as.character)


# summarise ---------------------------------------------------------------

?summarise

summarise(iris, num_rows = n(), mean_sepal_length = mean(sepal_length), sd_sepal_length = sd(sepal_length),
          num_setosas = sum(species == 'setosa'))

# again, jsut mention
summarise_if(iris, is.numeric, funs(mean, sd))


# pipeline ----------------------------------------------------------------

mutate(arrange(select(filter(iris, species == 'setosa'), -species), sepal_length, sepal_width), id = seq_len(n()))

iris %>% 
  filter(species == 'setosa') %>% 
  select(-species) %>% 
  arrange(sepal_length, sepal_width) %>% 
  mutate(id = seq_len(n()))

# Star Wars ---------------------------------------------------------------

data('starwars')

# following pipes write by commands

starwars %>% 
  summarise(mean_height = mean(height, na.rm = T),
            num_droids = sum(species == 'Droid', na.rm = T))

starwars %>% 
  mutate(bmi = mass / (height / 100)^2) %>% 
  arrange(desc(bmi))

starwars %>% 
  select(-ends_with('color')) %>% 
  mutate(num_films = map_int(films, length)) %>% 
  arrange(-num_films) %>% 
  mutate(first_appearance = map_chr(films, 1)) %>% 
  filter(map2_int(vehicles, starships, ~length(.x) + length(.y)) > 0)
  # filter(map_int(vehicles, length) + map_int(starships, length) > 0)
  # filter(map_int(vehicles, length) > 0 | map_int(starships, length) > 0)

# run couple improvised examples

starwars %>% 
  group_by(species) %>% 
  filter(n() >= 2L) %>% 
  summarise(mean_mass = mean(mass, na.rm = T))

starwars %>% 
  filter(is.na(species))

starwars %>% 
  distinct(hair_color, .keep_all = T)


# Mammals sleep -----------------------------------------------------------

# http://genomicsclass.github.io/book/pages/dplyr_tutorial.html
msleep <- read_csv('data/msleep_ggplot2.csv', col_types = cols())
