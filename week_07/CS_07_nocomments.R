library(spData)
library(reprex)
library(ggplot2)
data(world)

ggplot(world,aes(x=gdpPercap, fill=continent, color=continent))+
   geom_density(alpha=0.5,color=F)+
   theme(legend.position="bottom")
