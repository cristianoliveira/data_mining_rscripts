library(class)

set.seed(123)
amostra = sample(2, 150, replace = T, prob=c(0.7, 0.3))

dataTreino = iris[amostra==1,]
dataClass  = iris[amostra==2,]

dim(dataTreino); 
dim(dataTeste);

install.packages("knn", dep=T)

pr = knn(dataTreino[,1:4], dataClass[,1:4], dataTreino[,5], k=10)

table(dataClass[,5], pr)
