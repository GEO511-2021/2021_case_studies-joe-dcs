library(tidyverse)
library(nycflights13)

arrange(flights, desc(distance))
view(flights)
#look at table to see code for furthest airport

combined <- left_join(flights, airports, by=c("dest" = "faa"))
#join tables 

view(combined)
#observe structure

farthest_airport <- arrange(combined, desc(distance))%>%      
  select(name)%>%
  slice(1)%>%
  as.character()
#arrange new set by descending distance, select only the name, and slice off all but the first value 