install.packages("e1071", dep=T)

library(e1071)

set.seed(123)

amostra = sample(2, 1000, replace=T,prob=c(0.7,0.3))

head(amostra)

creditoTreino = credito[amostra==1,]

creditoTeste  = credito[amostra==2,]

dim(creditoTreino)

modelo = naiveBayes(class~., creditoTreino)

attributes(modelo)

modelo

pr = predict(modelo, creditoTeste)

tbConfusao = table(creditoTeste$class, pr)

tbConfusao

txTrue  = (tbConfusao[1]+tbConfusao[4])/sum(tbConfusao) 
txFalse = (tbConfusao[2]+tbConfusao[3])/sum(tbConfusao)

txTrue

txFalse
