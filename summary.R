library(dplyr)
library(ggplot2)

books <- read.csv("/Users/meganashivakumar/Desktop/INFO201CODE/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

summary_info <- list()

# ADD COMMENTS
summary_info$num_observations <- nrow(books)

# ADD COMMENTS
summary_info$max_checkout_type <- books %>% 
  filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>% 
  pull(CheckoutType)

summary_info$max_checkout_title <- books %>% 
  filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>% 
  pull(Title)

summary_info$subject <- books %>% 
  group_by(Subjects) %>% 
  filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>% 
  pull(Subjects)

summary_info$publisher <- books %>% 
  group_by(Publisher) %>%
  filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>%
  pull(Publisher)

summary_info$min_print_checkouts <- books %>% 
  filter(CheckoutYear == "2017") %>% 
  group_by(MaterialType) %>% 
  filter(Checkouts == max(Checkouts)) %>% 
  pull(MaterialType)

summary_info$max_print_checkouts <- books %>% 
  filter(CheckoutYear == "2023") %>% 
  group_by(MaterialType) %>% 
  filter(Checkouts == max(Checkouts)) %>% 
  pull(MaterialType)
