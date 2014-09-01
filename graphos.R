install.packages("igraph", dependencies = T);

library(igraph);

help(igraph)

dados = read.csv(file.choose(), sep=",", header=T)

head(dados)


rede = graph.data.frame(dados, directed = F)

plot(rede)

install.packages("")

tkplot(rede)

dadosCPF = read.csv(file.choose(), sep=";", head=F)

dadosCPF

rede = graph.data.frame(dadosCPF, directed = F)

#tkplot(rede)

for(i in 1:length(V(rede))){
V(rede)$color[i] <- ifelse(substr(V(rede)$name[i],1,4), "gray","lightsalmon1");
V(rede)$vertex.size[i] <- ifelse(substr(V(rede)$name[i],1,4), 20, 10);}

plot(rede, edge.label=dadosCPF[,3], vertex.label.font=2, vertex.size = V(rede)$vertex.size, vertex.frame.color="gray",edge.label.color="black")
