library(tidyverse)
#load tidyverse

dataurl="https://data.giss.nasa.gov/tmp/gistemp/STATIONS/tmp_USW00014733_14_0_1/station.txt"
#grab data from live site

temp <- read_table(dataurl,
                   skip=3, #skip the first line which has column names
                   na="999.90", # tell R that 999.90 means missing in this dataset
                   col_names = c("YEAR","JAN","FEB","MAR", # define column names 
                                 "APR","MAY","JUN","JUL",  
                                 "AUG","SEP","OCT","NOV",  
                                 "DEC","DJF","MAM","JJA",  
                                 "SON","metANN"))

p1 <- ggplot(temp) +
  aes(x = YEAR, y = JJA) +
  geom_line(size = 1L, colour = "#3386D7") +
  labs(x = "Year", y = "Average Temperature (°C)", title = "Mean Summer Temperatures in Buffalo, NY") +
  theme_minimal() +
  theme(plot.title = element_text(size = 20L, hjust = 0.5)) +
  geom_smooth(colour = "#ff0000", fill = "#f4ae43")+
  scale_x_continuous(breaks = c(seq(1883, 2021, 10), 2021))

p1

#png("GrandpaGraph.png", width = 1000, height = 600)
#dev.off()

ggsave("GrandpaGraph.png", width = 12, height = 6)

