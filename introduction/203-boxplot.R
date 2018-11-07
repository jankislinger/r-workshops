require(tidyverse)

ggplot(msleep, aes(vore, sleep_total, fill = vore, color = vore)) +
  geom_boxplot(alpha = 0.7, show.legend = F) +
  geom_jitter(alpha = 0.4, show.legend = F) +
  coord_flip() +
  theme_dark()
