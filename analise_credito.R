credito = read.arff(file.choose())

head(credito)

install.packages("party",dep=T)

library(party)

arvore = ctree(class ~., data = credito)

plot(arvore)

predicao = predict(arvore)

confusao = table(predicao, credito$class)

confusao

predicao.tax_acerto = confusao[1] + confusao[4]/ sum(confusao);

predicao.tax_errro = confusao[2] + confusao[3]/ sum(confusao);

predicao.tax_acerto

dim(credito)

amostra = sample(2, 1000, replace = T, prob = c(0.7, 0.3));

amostra

dataTreino = credito[amostra==1,]
dataTeste  = credito[amostra==2,]

modelo = ctree(class ~. , data=dataTreino)

pre = predict(modelo, dataTeste)

tbConfusao = table(credito$class, pre)

set.seed(123)

amostra = 


