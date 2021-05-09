analyzer <- function(tfm, dist) {

  lex <- tfm[,c('one', 'two', 'three', 'four', 'five')]
  rm(tfm)

  source('normalize_by_dist.R')
  normalized <- apply(lex[,], 1, normalize_by_dist, dist=dist)

  normalized <- t(normalized)
  ######
  source('utest.R')
  chisq <- apply(normalized, 1, utest)
  ######
  source('normalize.R')
  normalized <- apply(normalized, 1, normalize)
  normalized <- t(normalized)

  normalized <- cbind(lex, normalized, chisq)
  rm(lex, chisq)
  ######
  normalized <- cbind(term = rownames(normalized), normalized)
  rownames(normalized) <- 1:nrow(normalized)
  colnames(normalized) <- c('term', 'one', 'two', 'three', 'four', 'five', 'one.1', 'two.1', 'three.1', 'four.1', 'five.1', 'chisq')
  normalized <- transform(normalized,
                          one = as.numeric(one),
                          two = as.numeric(two),
                          three = as.numeric(three),
                          four = as.numeric(four),
                          five = as.numeric(five),
                          one.1 = as.numeric(one.1),
                          two.1 = as.numeric(two.1),
                          three.1 = as.numeric(three.1),
                          four.1 = as.numeric(four.1),
                          five.1 = as.numeric(five.1),
                          chisq = as.numeric(chisq))
  normalized <- normalized[order(normalized$chisq),]
  return(normalized[normalized$term != 'feat1',])
}
