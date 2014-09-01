library(foreign)

dadosCredito = read.arff(file.choose())

head(dadosCredito)


install.packages("adabag", dep = T)

library(adabag)

modelo = boosting(class~., data = credito, mfinal = 20, coeflearn = 'Breiman')

plot(modelo$trees[[1]])
text(modelo$trees[[1]])

previsao = predict(modelo, credito)

previsao

set.seed(123)

amostra = sample(2, 1000, replace = T, prob=c(0.7, 0.3))

dataTreino = dadosCredito[amostra == 1,]

dataTeste  = dadosCredito[amostra == 2,]

modelo = boosting(class~., data=dataTreino, mfinal = 20, coeflearn = 'Breiman')

previsao = predict(modelo, dataTeste)

plot(previsao$confusion