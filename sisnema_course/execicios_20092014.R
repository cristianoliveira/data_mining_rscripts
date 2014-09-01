# exe 1 
vetor_texto  = c("um","dois","tres","quatro")
vetor_int    = as.integer(c(20, 10, 60, 40, 50, 30))
vetor_bolean = c(T, F, F, F, T)

class(vetor_int)

#exe 2
vetor_texto[2]
vetor_int[vetor_int<=40]
vetor_bolean[-1]

#exe 3
vetor_int[c(-2,-1)]
vetor_int[vetor_int>35]
max(vetor_int)