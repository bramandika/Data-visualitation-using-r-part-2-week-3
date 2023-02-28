install.packages("gapminder")
library("gapminder")
Gapminder=gapminder

#solution 1 by using array in r
gapminder_2007 = Gapminder[Gapminder$year == 2007, ]
head(gapminder_2007)


#second solution is by using dplyr
library(dplyr)
gapminder_2007_dplyr = Gapminder%>%
  filter(year == 2007)

you can read in https://dplyr.tidyverse.org/reference/filter.html

#boxplot with groups
boxplot(gapminder_2007$lifeExp ~ gapminder_2007$continent)

gapminder_2007$continent <- factor(gapminder_2007$continent , levels=c("Africa", "Asia", "Americas", "Europe","Oceania"))
boxplot(gapminder_2007$lifeExp ~ gapminder_2007$continent,
        xlab = 'Life Expectancy (year)',
        ylab = '',
        col = c('#FFBCD1','#1A759F','#34A0A4','#76C893','#B5E48C'),
        horizontal = T,
        col.axis = 'orange',
        col.lab = 'purple',
        las = 1,
        frame.plot = T,
        ylim = c(35,85),
        cex.axis = 0.8
)

axis(1, at = seq(35,85,5), col.axis = '#184E77', col = '#184E77', cex.axis = 0.8)
axis(2, col = '#184E77', labels = F)
title("Life Expectancy by Continent",
      adj  = 0, line = 2,
      col.main = '#184E77')
mtext("World gapminder data, year 2007", adj = 0, line = 0.5,
      col = '#184E77')
abline(v=70.65, col = "Red", lty = 5)
mtext("Indonesia : 70.65", adj = 0.58, line = -1.5, cex = 0.8,
      col = 'red', font = 2)
mtext("Afghanistan : 43.83", adj = 0.13, line = -10.3, cex = 0.6)
mtext("Haiti : 60.92", adj = 0.52, line = -7.2, cex = 0.6)

library("dplyr")

#line plot
gapminder_indonesia = Gapminder%>%
  filter(country == 'Indonesia')
gapminder_indonesia
gapminder_malaysia = Gapminder%>%
  filter(country == 'Malaysia')
x = gapminder_indonesia$year
y = gapminder_indonesia$pop
plot(x, y, type="b",main = "Line Chart for Malaysia and Indonesia")
#membuat kolom populasi dalam juta
gapminder_indonesia["Populasi (Juta)"] = gapminder_indonesia["pop"]/1000000
# gapminder_indonesia$year =  as.factor(gapminder_indonesia$year)
gapminder_indonesia

seq(1952, 2007, by=5)


x = gapminder_indonesia$year
y1 = gapminder_indonesia$gdpPercap
y2 = gapminder_malaysia$gdpPercap

plot(x, y1, type="b", col = "red", ylim = c(1,13000), xaxt='n', xlab="Tahun", ylab="GDP per Cap")
lines(x, y2, col = "blue", type = "b")
axis(1, at = seq(1952, 2007, by=5), labels=as.character(x), cex.axis = 0.8)
legend("topleft", legend=c("Indonesia", "Malaysia"),
       col=c("red", "blue"), lty = 1:1, cex=1.2)




#scatterplot
#basic scatterplot
plot(gapminder_2007$gdpPercap, gapminder_2007$lifeExp)
plot(gapminder_2007$gdpPercap, gapminder_2007$lifeExp,
     xlab = 'GDP per capita',
     xaxt='n',
     ylab = 'Life Expectancy',
     yaxt='n',
     col = ifelse(gapminder_2007$country=='Malaysia', 'red',
                  ifelse(gapminder_2007$country=='Indonesia', 'red',
                         ifelse(gapminder_2007$continent=='Asia', '#d9ed92',
                                ifelse(gapminder_2007$continent=='Europe', '#99d98c',
                                       ifelse(gapminder_2007$continent=='Africa', '#1e6091', 
                                              ifelse(gapminder_2007$continent=='Americas', '#52b69a',
                                                     '#168aad')))))),
     col.lab='#1e6091',
     col.axis= '#1e6091',
     cex.axis = 0.8,
     cex.lab = 0.8,
     font.lab = 2,
     pch = 19,
     frame.plot = F
)

mtext('World Gapminder Data', side=3, at=1, adj=0, cex=1.2,
      font = 2, col = '#1e6091')
mtext('Year : 2007', side=3, at=1, adj=0, cex=0.75, line = -0.88,
      font = 2, col = '#1e6091')
text(3500, 69, 'Indonesia', cex = 0.6, col = 'red')
text(14000, 72.6, 'Malaysia', cex = 0.6, col = 'red')
text(49500, 78.7, 'Norway', cex = 0.6, col = '#99d98c')
text(7500, 39.7, 'Swaziland', cex = 0.6, col = '#1e6091')


legend(x = 35000, y = 60, legend = c('Asia', 'Europe', 'Africa', 'Americas', 'Oceania'), 
       col = c('#d9ed92', '#99d98c', '#1e6091', 
               '#52b69a', '#168aad'),
       bty = 'n',
       pch = c(19, 19, 19, 19),
       cex = 0.82,
       text.col = '#1e6091'
)

axis(1, col = '#1e6091', col.axis= '#1e6091', cex.axis = 1, 
     at = seq(0, 50000, 10000),
     labels = c('0', '10k', '20k', '30k', '40k', '50k'))
axis(2, col = '#1e6091', col.axis= '#1e6091', cex.axis = 1