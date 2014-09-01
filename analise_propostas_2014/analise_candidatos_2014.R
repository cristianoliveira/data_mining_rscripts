#install.packages("tm", dep=T)
#install.packages("wordcloud", dep=T)
#install.packages("Rstem", dep=T)

library(tm)
library(wordcloud)
library(Rstem)

# Cria função para baixar e converter de pdf para text
getDataFromUrl <- function(pUrlPath){
                    url <- pUrlPath 
                    dest <- tempfile(fileext = ".pdf")
                    download.file(url, dest, mode = "wb") 
                    
                    system(paste("pdftotext ",dest),wait = T)
                    
                    filetxt <- sub(".pdf", ".txt", dest)
                    
                    return(readLines(filetxt))
}

analisaProposta <- function(pText){
  
  text = tolower(pText)
  
  cleanedText <- removeWords(text, c("\\f", stopwords('pt-br')))
  
  corpus <- Corpus(VectorSource(cleanedText))
  corpus <- tm_map(corpus, removePunctuation)
  corpus <- tm_map(corpus, removeNumbers)
  tdm    <- TermDocumentMatrix(corpus)
  m      <- as.matrix(tdm)
  d      <- data.frame(freq = sort(rowSums(m), decreasing = TRUE))
  
  print(pText)
  
  return(d)
  
}

# Proposta Aecio
proposta = getDataFromUrl("http://divulgacand2014.tse.jus.br/divulga-cand-2014/proposta/eleicao/2014/idEleicao/143/UE/BR/candidato/280000000085/idarquivo/229?x=1408666351000280000000085")
dadosAecio = analisaProposta(proposta)
topDezAecio = head(dadosAecio,10)

#Proposta Dilma
proposta = getDataFromUrl("http://divulgacand2014.tse.jus.br/divulga-cand-2014/proposta/eleicao/2014/idEleicao/143/UE/BR/candidato/280000000083/idarquivo/194?x=1406931687000280000000083")
proposta = gsub("milhões","", tolower(proposta))
proposta = gsub("mil","", tolower(proposta))
proposta = gsub("anos","", tolower(proposta))
dadosDilma = analisaProposta(proposta)
topDezDilma = head(dadosDilma, 10)

#Proposta Marina
proposta = getDataFromUrl("http://divulgacand2014.tse.jus.br/divulga-cand-2014/proposta/eleicao/2014/idEleicao/143/UE/BR/candidato/280000000063/idarquivo/108?x=1408755983000280000000063")
#tratamento para rodapé
proposta = gsub("MIOLO SEMDiretrizes FULL.indd", "", proposta)
dadosMarina = analisaProposta(proposta)
head(dadosMarina,10)

#todo Implementar avaliação por area
areas = c("saúde","educação","social","economia")
for (i in areas){
  print(i)
} 
