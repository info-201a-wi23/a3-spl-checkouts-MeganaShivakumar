library(dplyr)

books <- read.csv("/Users/meganashivakumar/Desktop/INFO201CODE/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

summary_info <- list()

summary_info$obvs <- nrow(books)

summary_info$max_checkout_type <- books %>% 
  filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>% 
  pull(CheckoutType)

summary_info$max_checkout_title <- books %>% 
  filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>% 
  pull(Title)

summary_info$subject <- books %>% 
  filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>% 
  pull(Subjects)

summary_info$publisher <- books %>% 
  filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>%
  pull(Publisher)

summary_info$min_print_checkouts <- books %>% 
  filter(CheckoutYear == "2017") %>%
  filter(Checkouts == max(Checkouts)) %>% 
  pull(MaterialType)

summary_info$max_print_checkouts <- books %>% 
  filter(CheckoutYear == "2023") %>%
  filter(Checkouts == max(Checkouts)) %>% 
  pull(MaterialType)
