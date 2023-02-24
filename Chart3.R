library(dplyr)
library(ggplot2)
books <- read.csv("/Users/meganashivakumar/Desktop/INFO201CODE/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

top_items <- books %>% 
  filter(MaterialType == "BOOK") %>% 
  select(Checkouts, Title) %>% 
  arrange(desc(Checkouts)) %>%
  slice(1:10)

top_items_df <- data.frame(top_items)

ggplot(data = top_items_df, aes(x = Title, y = Checkouts)) + 
  geom_bar(stat="identity", width=.5, fill="tomato3") + 
  labs(title = "Most Checked Out Books from 2017 - 2023", x = "Book Title", y = "Total Number of Checkouts") + 
  theme_light() 
  # theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

# how to angle x axis titles
