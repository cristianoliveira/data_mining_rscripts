var = matrix(c(1:12), nrow = 3, ncol = 3, byrow = T)

dimnames(var) = list(
	                 c('r1','r2','r3'),
	                 c('c1','c2','c3')
	                )

class(var)

varList = list('aa',list())

#replicate(2, rnorm(20))

