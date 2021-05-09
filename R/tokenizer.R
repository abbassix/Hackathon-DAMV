tokenizer<- function(corp, path, column) {
  library(quanteda)
  italian_stopwords <- utils::read.csv(path)[[2]]

  toks <- quanteda::tokens(corp[, column], what="word", remove_punct=F,
                           remove_numbers=F, remove_symbols=F,
                           remove_separators=F)
  toks <- quanteda::tokens_select(toks, pattern=italian_stopwords,
                                  selection="remove", case_insensitive=T,
                                  min_nchar=3)
  rm(italian_stopwords)

  compound_lemma <- base::c("smesso *", "senza *", "molto *", "troppo *",
                            "poco *", "tanto *", "abbastanza *", "affatto *",
                            "mai *", "abbasso *", "abbondantemente *",
                            "abilmente *", "abitualmente *", "buon *", "mal *",
                            "assolutamente *", "sembrava *")  # pienamente?
  toks <- quanteda::tokens_compound(toks,
                                    pattern = quanteda::phrase(compound_lemma))

  compound_lemma <- base::c("non *", "ne *")
  toks <- quanteda::tokens_compound(toks,
                                    pattern = quanteda::phrase(compound_lemma))
  # bigram_toks <- tokens_ngrams(toks, n = 1:3, skip = 0:2, concatenator = "_")
  # skipgram_toks <- tokens_ngrams(toks, n = 2L, skip = 1L, concatenator = "_")
  # toks <- c(toks, bigram_toks, skipgram_toks)
  # toks <- bigram_toks
  return(quanteda::dfm(toks, tolower=F))
}
