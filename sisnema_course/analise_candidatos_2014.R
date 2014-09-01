# here is a pdf for mining
url <- "http://divulgacand2014.tse.jus.br/divulga-cand-2014/proposta/eleicao/2014/idEleicao/143/UE/BR/candidato/280000000085/idarquivo/229?x=1408666351000280000000085"
dest <- tempfile(fileext = ".pdf")
download.file(url, dest, mode = "wb") 

dest

system("pdftotext")