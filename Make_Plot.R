#libraries
library(tidyverse)

#Assigning stuff
x <- read_rds("data.rds")

#Plot
myplot <- x |> 
  ggplot(aes(x = year)) +
  geom_bar() +
  labs(title = "Baseball Hall of Fame Inductions",
       subtitle = "Spike in 2006 associated with Negro League inclusion",
       x = "Year",
       y = "Number of Inductees",
       caption = "Data: Wikipedia")
ggsave("hof_plot.png", myplot)
