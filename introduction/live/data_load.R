
x <- 1
a <- 'ahoj'
save(x, a, file='data/x.rda')

load('data/trump_tweets.rda')
trump_tweets_df


# csv ---------------------------------------------------------------------

require(readr)

cameras <- read_csv('data/cameras.csv')


# excel -------------------------------------------------------------------

require(readxl)

pid <- read_excel('data/statistika_pid.xlsx', 1)
