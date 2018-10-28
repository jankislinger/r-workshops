require(tidyverse)
require(datasets)

# mammals sleep -----------------------------------------------------------

msleep <- read_csv('data/msleep_ggplot2.csv', col_types = cols())

ggplot(msleep, aes(bodywt, brainwt, color = sleep_total)) +
  geom_point(aes(shape = vore), na.rm = T) +  # put shape to global aes first
  scale_x_log10() +
  scale_y_log10() +
  geom_smooth(method = 'lm', se = F, color = 'gray', na.rm = T) +
  geom_text(aes(label = name), msleep %>% filter(name == 'Human'), nudge_y = 0.15, color = 'red') +
  theme_bw()

ggplot(msleep, aes(vore, sleep_total, fill = vore)) +
  geom_boxplot(outlier.alpha = 0) +
  geom_jitter(alpha = 0.2) +  # start with geom_point
  geom_text(aes(label = name), msleep %>% filter(name == 'Human')) +
  theme_dark()


# Star Wars ---------------------------------------------------------------

data("starwars")

starwars %>% 
  filter(name != 'Jabba Desilijic Tiure') %>% 
  ggplot(aes(height, mass)) +
  geom_point(na.rm = T) +
  geom_smooth(aes(color = gender), method = 'lm', se = F, na.rm = T) +
  geom_smooth(color = 'black', method = 'lm', se = F, na.rm = T, fullrange = T) +
  geom_smooth(color = 'black', method = 'lm', se = F, na.rm = T, fullrange = T, formula = y ~ 0 + x^2) +
  expand_limits(x = 0, y = 0)
  theme_minimal()
