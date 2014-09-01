install.packages('arules', dep=T)

library(arules)

data = read.transactions(file.choose(), format="basket", sep=";")

regras = apriori(data)

head(data)

inspect(regras)

image(data)

install.packages("arulesViz", dep=T)

plot(regras, method="graph", control=list(type="items"))
