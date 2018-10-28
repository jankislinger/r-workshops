require(tidyverse)
require(repurrrsive)

# show slide 'function arguments'
# show slides 34--42 from Jenny Bryan's presentation (plotcon 2016)

# many functions are ready for vectors
log(1)
x <- c(1, 3, 4, 17, Inf, NA)
log(x)
map(x, log)
map_dbl(x, log)



# simple maps -------------------------------------------------------------

tweets <- trump_tweets_df$text[1:10]
substr(tweets[1], 1, 10)
substr(tweets[1], start = 1, stop = 10)
map(tweets, substr, start = 1, stop = 10)
map_chr(tweets, substr, start = 1, stop = 10)
map_chr(tweets, substr, 1, 10)


map2_chr(tweets, seq_along(tweets), substr, start = 1)  # start is required
map2_chr(tweets, seq_along(tweets), ~substr(.x, 1, .y))
substr(tweets, 1, seq_along(tweets))


# pipeline ----------------------------------------------------------------

x %>% f(y, z = z)
# is the same as
f(x, y, z = z)

x <- c(0.109, 0.359, 0.63, 0.996, 0.515, 0.142, 0.017, 0.829, 0.907)
# x <- runif(10)
round(exp(diff(log(x))), 1)
x %>% log() %>%
  diff() %>%
  exp() %>%
  round(1)

# Game of Thrones ---------------------------------------------------------

got_chars
got_chars[[1]]

got_chars[[1]]$name
map_chr(got_chars, 'name')
map_chr(got_chars, ~.x$name)
map_chr(got_chars, `$`, 'name')

tv_series <- map(got_chars, 'tvSeries')
tv_series <- map_chr(got_chars, 'tvSeries')  # fails
tv_series

map_int(tv_series, length)
map_int(got_chars, ~length(.x$tvSeries))

names <- map_chr(got_chars, 'name')
actors <- map_chr(got_chars, 'playedBy')  # fails
got_chars[[20]]$playedBy  # oh, snap
paste(got_chars[[20]]$playedBy, collapse = ', ')  # try the function first on single example
actors <- map(got_chars, 'playedBy') %>% map_chr(paste, collapse = ', ')

map2(names, actors, paste, sep = ' by ')
map2_chr(names, actors, paste, sep = ' by ')
