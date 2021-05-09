top_feats <- function(corp) {
  base::library(quanteda)

  # make a new column made of both prefix and suffix bigrams
  corp$feats <- base::paste0(corp$prefix_feats, ' ', corp$suffix_feats)

  # remove everything other than those which start with 'X
  corp$feats <- base::gsub('\\b[^X].+?\\b', '', corp$feats)

  # remove all single characters
  corp$feats <- base::gsub('[^a-zàèéìíîòóùúX_ ]', '', corp$feats)

  # remove guarding 'X's
  corp$feats <- base::gsub('(\\b)[X](.+)?X(\\b)', '\\1\\2\\3', corp$feats)

  #return(corp)
  toks <- quanteda::tokens(corp$feats, what="word", remove_punct=F,
                           remove_numbers=F, remove_symbols=F,
                           remove_separators=F)
  italian_stopwords <- utils::read.csv('/Users/mehdi/sentiment_project/italian_stopwords.csv')[[2]]

  toks <- quanteda::tokens_select(toks, pattern=italian_stopwords,
                                  selection="remove", case_insensitive=T,
                                  min_nchar=3)

  dtm <- quanteda::dfm(toks)

  return(quanteda::colSums(dtm))
}
