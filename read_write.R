#Escrevendo e lendo dados de arquivo

#write.table(iris, "/home/cristianoliveira/SISNEMA/iris.csv", sep = ";")
#tabela = read.table("/home/cristianoliveira/SISNEMA/iris.csv", sep = ";")
#tabela

head(cars)

carros = cars

tablePath =  "/home/cristianoliveira/SISNEMA/carros.rdata"


save(carros, file=tablePath)
tabCarros = read.table(file=tablePath)

colnames(tabCarros)
rownames(tabCarros)