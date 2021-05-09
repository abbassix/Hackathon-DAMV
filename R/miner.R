miner <- function(corp, dist) {
  source('process.R')
  corp <- process(corp=corp)

  path <- "/Users/mehdi/sentiment_project/italian_stopwords.csv"

  source('tokenizer.R')
  dtm <- tokenizer(corp=corp, path=path, column='preprocessed')

  source('tfm.R')
  tfm <- tfm(dtm=dtm, corp=corp)

  source('analyzer.R')
  lexicon <- analyzer(tfm=tfm, dist=dist)

  return(lexicon)
}
