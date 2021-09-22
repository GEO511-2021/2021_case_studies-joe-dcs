#load packages
library(ggplot2); library(gapminder); library(dplyr)

#remove kuwait
no_kuwait <- filter(gapminder, country != "Kuwait")

#plot this 
p1 <- ggplot(no_kuwait, aes(lifeExp, gdpPercap, color = continent, size = pop/10000))+
             theme_bw()+
             geom_point()+
             facet_wrap(~year,nrow=1)+
             scale_y_continuous(trans = "sqrt")+
             labs(x="Life Expectancy", y="GDP per Capita")
p1

 grouped_no_kuwait <- group_by(no_kuwait, continent, year)
 
 gapminder_continent <- summarize(grouped_no_kuwait, 
                                  gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop), 
                                  pop = sum(as.numeric(pop)))
 
p2 <- ggplot(gapminder, aes(x = year, y = gdpPercap, size = pop/10000))+
             geom_line()+
             geom_point()+
             geom_line(data=gapminder_continent, aes(gdpPercapweighted, pop))+
             geom_point(data=gapminder_continent)+
             facet_wrap(facets = gapminder_continent)+
             theme_bw()+
             labs(x = "Year", y = "GDP per Capita")

p2
