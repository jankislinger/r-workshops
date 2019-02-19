require(tidyverse)
require(readxl)

col_names <- c('depth', 'var', 'pr', 'prr')

data <- read_excel('data/penetracni_odpor.xlsx',
                   col_names = c('depth', 'var', 'pr', 'prr', 1:5), skip = 1) %>% 
  select(depth, var, pr, prr) %>% 
  group_by(depth, var) %>% 
  summarise(pr = mean(pr)) %>% 
  ungroup() %>% 
  mutate(se = 0.3 * pr)

ggplot(data, aes(depth, weight = pr)) +
  geom_bar() +
  geom_errorbar(aes(ymin = pr - se, ymax = pr + se)) +
  facet_grid(~var) +
  coord_flip() +
  scale_x_continuous(breaks = seq(0, 40, 4), minor_breaks = seq(0, 40, 4))
  

ggplot(data, aes(depth, y = pr)) +
  geom_line(aes(color = var)) +
  geom_errorbar(aes(ymin = pr - se, ymax = pr + se, fill = var), alpha = 0.1) +
  # geom_errorbar(aes(ymin = pr - se, ymax = pr + se)) +
  scale_x_continuous(breaks = seq(0, 40, 4), minor_breaks = seq(0, 40, 4))


