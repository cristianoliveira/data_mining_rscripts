library(foreign)

dataGlass = read.arff(file.choose())

set.seed(123)

amostra = sample(2, 214, replace = T, prob = c(0.7, 0.3))

dataTreino = dataGlass[amostra == 1,]
dataForClass = dataGlass[amostra==2,]

pr = knn(dataTreino[,1:9], dataForClass[,1:9], dataTreino[,10], k=1)

table(dataForClass[,10], pr)

library(caret)

confusionMatrix(dataForClass[,10] , pr)
