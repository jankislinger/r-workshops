# datasets ----------------------------------------------------------------

require(datasets)

data("band_instruments")
band_instruments

data("Titanic")
Titanic

data("starwars")
starwars


# RData -------------------------------------------------------------------

my_data <- starwars
save(my_data, file = 'data/my_data.rda')

rm(my_data)
my_data

list.files()

load('data/my_data.rda')
my_data

file_url <- 'http://varianceexplained.org/files/trump_tweets_df.rda'
file_name <- 'data/trump_tweets.rda'
if (!file.exists(file_name)) download.file(file_url, file_name)
load(file_name)

# csv ---------------------------------------------------------------------

require(tidyverse)

cameras <- read_csv('data/cameras.csv')
cameras <- read_csv('data/cameras.csv', col_types = cols())

# from readme
file_url <- 'https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv'
file_name <- 'data/msleep_ggplot2.csv'
if (!file.exists(file_name)) download.file(file_url, file_name)
msleep <- read_csv(file_name)
msleep <- read_csv(file_name, col_types = cols())
