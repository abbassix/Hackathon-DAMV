tfm <- function(dtm, corp) {
  corp_star <- base::as.numeric(corp$star)

  dtm <- dfm_trim(dtm, min_termfreq = 3)

  dtm_star <- base::cbind(dtm, corp_star)

  dtm_one_star <- quanteda::dfm_subset(dtm_star, corp_star==1)
  dtm_two_stars <- quanteda::dfm_subset(dtm_star, corp_star==2)
  dtm_three_star <- quanteda::dfm_subset(dtm_star, corp_star==3)
  dtm_four_stars <- quanteda::dfm_subset(dtm_star, corp_star==4)
  dtm_five_stars <- quanteda::dfm_subset(dtm_star, corp_star==5)

  rm(dtm_star, corp_star)

  # frequency of each term in the corpus
  tf1 <- quanteda::colSums(dtm_one_star)
  rm(dtm_one_star)
  tf2 <- quanteda::colSums(dtm_two_stars)
  rm(dtm_two_stars)
  tf3 <- quanteda::colSums(dtm_three_star)
  rm(dtm_three_star)
  tf4 <- quanteda::colSums(dtm_four_stars)
  rm(dtm_four_stars)
  tf5 <- quanteda::colSums(dtm_five_stars)
  rm(dtm_five_stars)

  tfm <- base::cbind(tf1, tf2, tf3, tf4, tf5)
  rm(tf1, tf2, tf3, tf4, tf5)
  base::colnames(tfm) <- base::c('one', 'two', 'three', 'four', 'five')
  return(tfm)
}
