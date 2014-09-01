install.packages("fpc")
library(fpc)

cluster = pamk(USArrests, usepam = T)

cluster$pamobject


pamCluster = pam(USArrests, k = 5)

plot3d(USArrests[,1], USArrests[,2] , USArrests[,3], col = pamCluster$clustering , type="s")
