install.packages("tm")

library(tm)


corpus = VCorpus(DirSource("bla"))

corpus = tm_map(corpus, removeWords, stopwords("portuguese"))

corpus = tm_map(corpus, removePunctuaton)

corpus = tm_map(corpus, removeNumber)

frequence = TermDocumentMatrix(corpus);

#corpus = tm_map(corpus, stemDocument, language="portuguese")

ft = as.data.frame(frequence$v,frequence$dimnames$term)

nuvem = subset(ft, frequence$V  >= 5)

wordcloud(words=rownames(nuvem), freq=nuvem[,1], min.freq=5, ramdom.order = TRUE, rot.per=0.5, color=rainbow(8))


