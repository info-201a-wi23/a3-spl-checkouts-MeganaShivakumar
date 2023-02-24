library(dplyr)
library(ggplot2)
books <- read.csv("/Users/meganashivakumar/Desktop/INFO201CODE/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

group_by_year <- books %>% 
  group_by(MaterialType) %>% 
  summarise(total_checkouts = sum(Checkouts)) %>% 
  slice(1:5)

group_by_year_df <- data.frame(group_by_year)

ggplot(data = group_by_year_df, aes(x = MaterialType, y = total_checkouts)) + 
  geom_bar(stat="identity", width=.5, fill="tomato3") + 
  labs(title = "Number of Checkouts Per Item Type", x = "Type of Item", y = "Total Number of Checkouts") +
  theme_light() +
  coord_flip()

# How to add breaks so that all values can be seen?
