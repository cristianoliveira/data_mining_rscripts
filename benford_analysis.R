install.packages('benford.analysis',dep=T)

library(benford.analysis)

dados = read.csv(file.choose(), sep=",")

dados


class(dados$VALOR)

valor = as.numeric(dados$VALOR)

class(valor)

bef = benford(valor, number.of.digits=1)

plot(bef)
