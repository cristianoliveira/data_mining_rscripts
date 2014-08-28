#verifique a correlação entre comprimento e altura dados= iris

iris.lm = lm(iris$Petal.Length~iris$Petal.Width, data=iris)

plot(iris$Petal.Length~iris$Petal.Width, data=iris)

abline(iris.lm)

novaIris = data.frame(Petal.Width = 120)

predict(iris.lm, novaIris)
