library(dplyr)
library(ggplot2)
books <- read.csv("/Users/meganashivakumar/Desktop/INFO201CODE/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

group_by_year_books <- books %>% 
  filter(MaterialType == "BOOK") %>% 
  group_by(CheckoutYear) %>% 
  summarise(total_checkouts = sum(Checkouts))

group_by_year_books_df <- data.frame(group_by_year_books)
colnames(group_by_year_books_df) <- c("CheckoutYear", "Books")

group_by_year_ebooks <- books %>% 
  filter(MaterialType == "EBOOK") %>% 
  group_by(CheckoutYear) %>% 
  summarise(total_checkouts = sum(Checkouts))

group_by_year_ebooks_df <- data.frame(group_by_year_ebooks)
colnames(group_by_year_ebooks_df) <- c("CheckoutYear", "Ebooks")

group_by_year_audiobooks <- books %>% 
  filter(MaterialType == "AUDIOBOOK") %>% 
  group_by(CheckoutYear) %>% 
  summarise(total_checkouts = sum(Checkouts))

group_by_year_audiobooks_df <- data.frame(group_by_year_audiobooks)
colnames(group_by_year_audiobooks_df) <- c("CheckoutYear", "Audiobooks")

all_groups_df <- cbind(group_by_year_books_df, group_by_year_ebooks_df, group_by_year_audiobooks_df, by="CheckoutYear")
all_groups_df <- all_groups_df[!duplicated(as.list(all_groups_df))]

colors <- c("Books" = "blue", "Ebooks" = "red", "Audiobooks" = "orange")

ggplot(data = all_groups_df, aes(x = CheckoutYear)) +
  geom_line(aes(y = Books, color = "Books")) + 
  geom_line(aes(y = Ebooks, color = "Ebooks")) + 
  geom_line(aes(y = Audiobooks, color = "Audiobooks")) + 
  labs(title = "How Number of Checkouts Have Changed Over Time from 2017 - 2023", x = "Checkout Year", y = "Total Number of Checkouts", colors = "Legend", color = "Legend - Different Forms of Books") +
  scale_color_manual(values = colors) + 
  theme_light()
