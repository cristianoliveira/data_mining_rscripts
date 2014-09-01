#exe 1 
attach(iris)

Sepal.Length

max(Sepal.Length)

#exe 2
length(Sepal.Length)

#exe 3
seq(from=10, to=50, by=5)

#exe 4
valFromScan = scan()
21
32
434
54
45

valFromScan

#exe 5
myText = "0"
myInt  = as.numeric(myText) 
class(myInt)

#exe 6
myDataPath = "~/SISNEMA/exercicio_dados.csv"
write.table(iris, myDataPath, , sep=";")
myReadTable = read.table(myDataPath, sep=";")

myReadTable

#exe 7
head(myReadTable)
tail(myReadTable)

#exe 8
summary(iris)

#exe9
#sample(1:5,size=10, replace=F)
#impossível tomar uma amostra maior que a população quando 'replace = FALSE'
sample(1:5,size=10, replace=T)

