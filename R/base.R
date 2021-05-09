base::setwd('/Users/mehdi/sentimeter/R/')

###############################################################################
#                         R E A D I N G    F I L E S                          #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
source('read_files.R')
base::setwd('/Users/mehdi/sentiment_project/corpus_somma')
corp <- read_files(path='.')
###############################################################################

###############################################################################
#                        P R E - P R O C E S S I N G                          #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
base::setwd('/Users/mehdi/sentimeter/R/')

source('pre_process.R')
corp <- pre_process(corp=corp)

source('miner.R')
dist <- c(17049, 9069, 17018, 9515, 33418)
lexicon <- miner(corp, dist)

source('lexicon_updater.R')
lexicon <- lexicon_updater(lexicon)

source('lexicon_extractor.R')
lexicon <- lexicon_extractor(lexicon)

base::saveRDS(lexicon, file = "lexicon.RDS")

# term <- 'perfettX'
# chisq <- lexicon[lexicon$term == term, 'chisq']
#
# source('disparity.R')
# disp <- disparity(corp, dist, term)
#
# source('analyzer.R')
# disp_lexicon <- analyzer(tfm=disp, dist=dist)

# source('normalize_by_dist.R')
# disp_normalized <- apply(disp, 1, normalize_by_dist, dist=dist)
#
# disp_normalized <- t(disp_normalized)
# ######
# source('utest.R')
# disp_chisq <- apply(disp_normalized, 1, utest)
# ######
# source('normalize.R')
# disp_normalized <- apply(disp_normalized, 1, normalize)
# disp_normalized <- t(disp_normalized)
#
# source('post_process.R')
# corp_temp5 <- post_process(corp=corp_temp5, term=term)
# source('top_feats.R')
# temp5 <- top_feats(corp_temp5, num=500, dist=dist, star=star)  # we just need top_features!
#
# terms <- intersect(names(temp1), names(temp5))
# for (term in terms) {
#   ratio <- temp1[term] / temp5[term]
#   if (ratio > 1) {
#     print(base::paste0(term, ': ', base::round(ratio, 2)))
#   }
# }
