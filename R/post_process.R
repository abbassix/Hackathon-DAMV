post_process <- function(corp, term) {

  # makes a bigram where the term is on RHS
  pattern <- base::paste0('(\\b)([a-zàèéìíîòóùúX]+) ', term)
  corp$prefix_feats <- base::gsub(pattern, base::paste0('\\1\\2 X\\2_', term, 'X ', term), corp$textitle)

  # makes a bigram where the term is on LHS
  pattern <- base::paste0(term, ' ([a-zàèéìíîòóùúX]+)(\\b)')
  corp$suffix_feats <- base::gsub(pattern, base::paste0(' X', term, '_\\1X \\1\\2'), corp$textitle)

  return(corp)
}
