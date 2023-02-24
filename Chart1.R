library(dplyr)
library(ggplot2)
books <- read.csv("/Users/meganashivakumar/Desktop/INFO201CODE/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

group_by_year1 <- books %>% 
  group_by(CheckoutYear) %>% 
  summarise(total_checkouts = sum(Checkouts))

ggplot(data = group_by_year1, aes(x = CheckoutYear, y = total_checkouts)) +
  geom_line() + 
  labs(title = "How Number of Checkouts Have Changed Over Time", x = "Checkout Year", y = "Total Number of Checkouts") +
  theme_light()

#ADD ANOTHER LINE