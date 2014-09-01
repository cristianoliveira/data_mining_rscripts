library(wordcloud)

wordcloud(words$words, words$freq)

library(aplpack)

myFaces = read.csv(file.choose(), sep=";", header = T)

faces(myFaces,labels=myFaces$Nome)

women

cor(women)

plot(women$height, women$weight)

plot(myFaces$AlturaRosto, myFaces$LarguraRosto)

women.lm = lm(height ~ weight, data = women)

peso = 180

altura = women.lm$coefficients[1] + women.lm$coefficients[2] * peso

altura

novodf = data.frame(weight = 180)

predict(women.lm, novodf)

women.lm

apline(women.lm)

plot(women$height, women$weight)

plot(women$height~women$weight, data=women)

abline(women.lm)
