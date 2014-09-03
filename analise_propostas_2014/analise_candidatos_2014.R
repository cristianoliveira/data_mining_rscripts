############ATENÇÃO
#  No windows é necessário baixar o executável 'pdftotext.exe' >> http://www.foolabs.com/xpdf/download.html
#  No Linux esta função já existe

#install.packages("tm", dep=T)
#install.packages("wordcloud", dep=T)
#install.packages("Rstem", dep=T)
install.packages("Rgraphviz", dep=T)


library(tm)
library(wordcloud)
source("http://bioconductor.org/biocLite.R")
biocLite("Rgraphviz")

# Cria função para baixar e converter de pdf para text
getDataFromUrl <- function(pUrlPath){
  url  <- pUrlPath 
  dest <- tempfile(fileext = ".pdf")
  download.file(url, dest, mode = "wb")
  system(paste("pdftotext ",dest),wait = T)
  filetxt <- sub(".pdf", ".txt", dest)
  pureText = paste(readLines(filetxt),collapse=" ")
  
  pureText
  
  return(pureText)
}

analisaPropostas <- function(pPropostas){
  
  otherStopWords = c("\f","\\f","MIOLO SEMDiretrizes FULL.indd","políticas","política","governo","governos","milhões","mil","anos", "governos", "governo")
  propostasLow = tolower(pPropostas)
  
  propostasCleaned <- removeWords(propostasLow, c("\\f", stopwords('pt-br')))
  propostasCleaned <- removeWords(propostasCleaned, otherStopWords)
  
  corpus <- Corpus(VectorSource(propostasCleaned))
  corpus <- tm_map(corpus, removePunctuation)
  corpus <- tm_map(corpus, removeNumbers)
  tdm    <- TermDocumentMatrix(corpus)
  m      <- as.matrix(tdm)
  d      <- data.frame(freq = sort(rowSums(m), decreasing = TRUE))
  
  as.TermDocumentMatrix(m, weighting = weightTf)
  
}

# Proposta Aecio
propostaAecio = getDataFromUrl("http://divulgacand2014.tse.jus.br/divulga-cand-2014/proposta/eleicao/2014/idEleicao/143/UE/BR/candidato/280000000085/idarquivo/229?x=1408666351000280000000085")
dadosAecio    = analisaProposta(propostaAecio)
topDezAecio   = head(dadosAecio,10)

#Proposta Dilma
propostaDilma = getDataFromUrl("http://divulgacand2014.tse.jus.br/divulga-cand-2014/proposta/eleicao/2014/idEleicao/143/UE/BR/candidato/280000000083/idarquivo/194?x=1406931687000280000000083")
dadosDilma    = analisaProposta(propostaDilma)
topDezDilma   = head(dadosDilma, 10)

#Proposta Marina
propostaMarina = getDataFromUrl("http://divulgacand2014.tse.jus.br/divulga-cand-2014/proposta/eleicao/2014/idEleicao/143/UE/BR/candidato/280000000063/idarquivo/108?x=1408755983000280000000063")
#tratamento para rodapé
#propostaMarina     = gsub(, "", propostaMarina)
dadosMarina  = analisaProposta(propostaMarina)
topDezMarina = head(dadosMarina,10)

todasPropostas = c(propostaAecio, propostaDilma, propostaMarina)
analisePropostas = analisaPropostas(todasPropostas)

# seta o cabeçalho de cada documento no TermDocumentMatrix
colnames(analisePropostas) <- c("Aecio","Dilma","Marina") 

termosEmComum = removeSparseTerms(analisePropostas, 0.1)
colnames(termosEmComum) <- c("Aecio","Dilma","Marina") 

inspect(termosEmComum)

plot(termosEmComum)
