library(e1071)

modelo = svm(Species~. , data=iris)

pr  = predict(modelo, iris)

pr

table(iris$Species, pr)
