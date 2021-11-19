data(iris)
#loads the database
iris$Petal.Length
#pull column
library(ggplot2)
#load ggpolt
qplot(iris$Petal.Length, 
      geom="histogram",
      binwidth = .25,
      main = "Petal Length Histogram",
      xlab = "Length in cm",
      ylab = "Count",
      fill=iris$Species)+
  scale_fill_discrete(name="Species", type=c("red", "orange", "yellow"))