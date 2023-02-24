library(dplyr)
library(ggplot2)
library(stringr)
books <- read.csv("/Users/meganashivakumar/Desktop/INFO201CODE/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

top_items <- books %>% 
  filter(MaterialType == "BOOK") %>% 
  select(Checkouts, Title) %>% 
  arrange(desc(Checkouts)) %>%
  slice(1:10)

top_items_df <- data.frame(top_items)

ggplot(data = top_items_df, aes(x = Title, y = Checkouts)) + 
  geom_bar(stat="identity", width=.5, fill="blue") + 
  labs(title = "Most Checked Out Books from 2017 - 2023", x = "Book Title", y = "Total Number of Checkouts") +
  theme_light() +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 10))
