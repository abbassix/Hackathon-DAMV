lexicon_extractor <- function(lexicon) {
  # lexicon[c('one.1', 'two.1', 'three.1', 'four.1', 'five.1', 'confidence')]
  library(dplyr)
  lexicon <- dplyr::select(lexicon, 'term', 'one.1', 'two.1', 'three.1', 'four.1', 'five.1', 'confidence')
  colnames(lexicon) <- c('term', 'one', 'two', 'three', 'four', 'five', 'confidence')
  return(lexicon)
}
