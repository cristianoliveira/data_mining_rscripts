grupo = kmeans(USArrests, centers = 3, algorithm = "Hartigan-Wong")

grupo

library(rgl)

plot3d(USArrests[,1], USArrests[,2] , USArrests[,3], col = grupo$cluster , type="s")
