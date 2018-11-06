require(tidyverse)
require(datasets)


# iris --------------------------------------------------------------------

data("iris")

iris
iris <- as_data_frame(iris)
iris

View(iris)


# quick comparison of base vs tidyverse
iris[iris$Species == 'setosa', endsWith(colnames(iris), 'Width')]  # from 101-console.R
iris %>% 
  filter(Species == 'setosa') %>% 
  select(ends_with('width'))


# select ------------------------------------------------------------------

?select

select(iris, Petal.Width, Sepal.Length)
select(iris, Sepal.Width:Petal.Width)
select(iris, 1:3)
select(iris, starts_with('Sepal'))

select(iris, everything())
select(iris, Species, everything())  # real pain in base R

select(iris, -Species)
select(iris, -starts_with('Sepal'))


# filter ------------------------------------------------------------------

?filter

filter(iris, Species == 'setosa')
filter(iris, Sepal.Length >= 5)
filter(iris, Species == 'setosa', Sepal.Length >= 5)   # AND
filter(iris, Species == 'setosa' & Sepal.Length >= 5)  # AND, but use comma instead
filter(iris, Species == 'setosa' | Sepal.Length >= 5)  # OR


# arrange -----------------------------------------------------------------

?arrange

arrange(iris, Petal.Width)
arrange(iris, Petal.Width, Petal.Length)

arrange(iris, desc(Petal.Width))
arrange(iris, -Petal.Width)
arrange(iris, desc(Petal.Width), Petal.Length)

arrange(iris, Species)
arrange(iris, desc(Species))
arrange(iris, -Species)  # fails


# mutate ------------------------------------------------------------------

?mutate

mutate(iris, Sepal.Ratio = Sepal.Width / Sepal.Length)
mutate(iris, Sepal.Ratio = Sepal.Width / Sepal.Length, Petal.Ratio = Petal.Width / Petal.Length)
mutate(iris, one = 1)
mutate(iris, id = seq_len(n()))
mutate(iris, n = row_number(Sepal.Length))

mutate(iris, Sepal.Length = as.integer(Sepal.Length * 10))
mutate(iris, Species = toupper(Species))

transmute(iris, Species = Species, Sepal_ratio = Sepal.Width / Sepal.Length, Petal_ratio = Petal.Width / Petal.Length)

# several other functions - not into details today
mutate_at(iris, vars(1:4), funs(as.integer(. * 10)))
mutate_if(iris, is.numeric, funs(as.integer(. * 10)))
mutate_if(iris, is.factor, as.character)


# summarise ---------------------------------------------------------------

?summarise

summarise(iris, num_rows = n(), mean_Sepal.Length = mean(Sepal.Length), sd_Sepal.Length = sd(Sepal.Length),
          num_setosas = sum(Species == 'setosa'))

# again, jsut mention
summarise_if(iris, is.numeric, funs(mean, sd))


# pipeline ----------------------------------------------------------------

mutate(arrange(select(filter(iris, Species == 'setosa'), -Species), Sepal.Length, Sepal.Width), id = seq_len(n()))
mutate(arrange(select(iris, Species == 'setosa'), Sepal.Length, Sepal.Width), id = seq_len(n()))

iris %>% 
  filter(Species == 'setosa') %>% 
  select(-Species) %>% 
  # arrange(Sepal.Length, Sepal.Width) %>% 
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
  group_by(Species) %>% 
  filter(n() >= 2L) %>% 
  summarise(mean_mass = mean(mass, na.rm = T))

starwars %>% 
  filter(is.na(Species))

starwars %>% 
  distinct(hair_color, .keep_all = T)


# Mammals sleep -----------------------------------------------------------

# http://genomicsclass.github.io/book/pages/dplyr_tutorial.html
msleep <- read_csv('data/msleep_ggplot2.csv', col_types = cols())
