weather = read.arff(file.choose())

set.seed(123)
amostra = sample(2, 1000, replace=T,prob=c(0.7,0.3))

dataTreino = weather[amostra==1,] 
dataTeste  = weather[amostra==2,]

model = naiveBayes(class~., weather)

p = predict(model, weather)

tb = table(p, weather$class)

