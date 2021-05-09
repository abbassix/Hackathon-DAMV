#* 
#* Provide the star-distribution of a given term
#* @get /termstar
#* 
function(term) {
  #path <- system.file ("extdata", "lexicon.rds", package = "sentimeter")
  path <- 'lexicon.rds'
  lexicon <- readRDS(path)
  star_value <- lexicon[lexicon$term==term,]
  return(star_value)
}