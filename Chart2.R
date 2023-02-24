library(dplyr)
library(ggplot2)
library(ggforce)
books <- read.csv("/Users/meganashivakumar/Desktop/INFO201CODE/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

group_by_year <- books %>% 
  group_by(MaterialType) %>% 
  summarise(total_checkouts = sum(Checkouts)) %>% 
  slice(1:5)

group_by_year_df <- data.frame(group_by_year)

ggplot(group_by_year_df) +
  aes(x = MaterialType, y = total_checkouts) +
  aes(x = reorder(MaterialType, +total_checkouts)) + 
  geom_col(width=.5, fill="tomato3") +
  labs(title = "Number of Checkouts Per Item Type from 2017 - 2023", x = "Type of Item", y = "Total Number of Checkouts") +
  facet_zoom(ylim = c(0, 7200)) + 
  theme_light() + 
  theme(axis.text.x = element_text(angle = 90))
