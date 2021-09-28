#load packages
library(ggplot2); library(gapminder); library(dplyr)

#remove kuwait
no_kuwait <- filter(gapminder, country != "Kuwait")

#plot this 
p1 <- ggplot(no_kuwait, aes(lifeExp, gdpPercap, color = continent, size = pop/100000))+
  theme_bw()+
  geom_point()+
  facet_wrap(~year,nrow=1)+
  scale_y_continuous(trans = "sqrt")+
  labs(x="Life Expectancy", y="GDP per Capita", size = "Population (100k)")
p1

ggsave("Plot1.png", width = 15, height = 5)

grouped_no_kuwait <- group_by(no_kuwait, continent, year)

gapminder_continent <- summarize(grouped_no_kuwait, 
                                 gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop), 
                                 pop = sum(as.numeric(pop))
)

p2 <- ggplot(no_kuwait, aes(x = year, y = gdpPercap))+
  geom_line(aes(color=continent, group=country))+
  geom_point(aes(color=continent))+
  geom_line(gapminder_continent, mapping = aes(year, gdpPercapweighted))+
  geom_point(gapminder_continent, mapping = aes(year, gdpPercapweighted, size = pop))+
  theme_bw()+
  facet_wrap(~continent,nrow=1)+
  labs(x = "Year", y = "GDP per Capita")

ggsave("Plot2.png", width = 15, height = 5)



