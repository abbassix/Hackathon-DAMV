distribution <- function(corp, dist, star) {
  corp <- corp[corp$star == star,]
  source('post_process.R')
  corp <- post_process(corp=corp, term=term)
  source('top_feats.R')
  return(top_feats(corp))  # we just need top_features!
}
