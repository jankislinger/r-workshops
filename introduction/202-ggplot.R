require(tidyverse)

msleep <- read_csv('data/msleep_ggplot2.csv', col_types = cols())

options(scipen = 10000)

msleep <- msleep %>% 
  mutate(vore = ifelse(is.na(vore), 'unknown', vore))

human <- filter(msleep, name == 'Human')

ggplot(msleep, aes(bodywt, brainwt)) + 
  geom_point(aes(shape = vore, color = sleep_total),
             na.rm = TRUE, show.legend = TRUE) +
  geom_smooth(aes(group = vore), method = 'lm', na.rm = TRUE, se = FALSE, color = 'black') +
  geom_point(aes(color = sleep_total), data = human, size = 5) +
  geom_text(aes(label = name), data = human, nudge_y = 0.2) +
  labs(x = 'Body weight', y = 'Brain weight', shape = 'Vore') +
  ggtitle('Title', 'Subtitle') + 
  scale_x_log10() +
  scale_y_log10(breaks = c(0.001, 0.1, 10),
                labels = c('small', 'medium', 'large')) +
  scale_shape_manual(values=c(4, 16, 17, 19, 15)) +
  theme_minimal()


ggplot(msleep, aes(sleep_total)) +
  geom_histogram(bins = '9')

ggplot()
