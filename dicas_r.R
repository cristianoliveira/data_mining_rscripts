summary(iris$Species)

as.integer(iris$Species)

plot(jitter(iris$Sepal.Length),
     xlab="Length",
     iris$Sepal.Width,
     ylab = "Width",
     col=as.integer(as.integer(iris$Species)),
     pch = 1,
     cex=iris$Petal.Width
     )

library(rgl)

plot3d(iris[,1],iris[,2],iris[,3])

summary(iris[,1])
hist(iris[,1])
