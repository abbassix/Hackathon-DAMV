lexicon_updater <- function(lexicon) {
  lexicon$sum = lexicon$one + lexicon$two + lexicon$three + lexicon$four + lexicon$five
  lexicon$confidence = base::log10(lexicon$sum)
  return(lexicon)
}
