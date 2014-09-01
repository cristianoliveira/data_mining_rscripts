gastos_eleicao   = read.csv(file.choose(), sep=";", header=T)

novos_candidatos = read.csv(file.choose(), sep=";", header=T)

head(gastos_eleicao)

head(novos_candidatos)

modelo = glm(SITUACAO~DESPESAS, data = gastos_eleicao, family = "binomial")

novos_candidatos$resultado = predict(modelo ,newdata =  gastos_eleicao, type = "response")

novos_candidatos

modelo

summary(modelo)



plot(gastos_eleicao$CANDIDATO, gastos_eleicao$DESPESAS)

