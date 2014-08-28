install.packages("randomForest", dep=T)

library(randomForest)

set.seed(123)
amostra = sample(2, 1000, replace=T,prob=c(0.7,0.3))

creditoTreino = credito[amostra==1,]

creditoTeste  = credito[amostra==2,]

model = randomForest(class~., data=creditoTreino, ntree = 100, proximity =T)

previsao = predict(modelo, creditoTeste)

tbConfusao = table(previsao, creditoTeste$class)

tbConfusao
