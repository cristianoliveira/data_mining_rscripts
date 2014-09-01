install.packages("maps")

library(maps)

map(database="world", regions="Brazil")

map.axes()

map.cities(minpop=1000000, label=T)

map(database="world", regions="Brazil", fill = T, bg="white", col="lightgreen")


#dadosCapitais = read.csv(file.choose(),sep=";",header=T)

dadosCapitais

map.cities(minpop=1000000, label=T)

map.axes()


a = 0
while (a < nrow(dadosCapitais))
{
  a = a + 1
  points(x=dadosCapitais[a,3] , y=dadosCapitais[a,2], bg=1, cex=dadosCapitais[a,4]/100000000, pch=21, lwd=0, col=NULL)
}
