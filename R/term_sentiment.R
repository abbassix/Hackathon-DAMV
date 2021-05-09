#' Term Sentiment
#'
#' Analyze the sentiment of a word using exclusive sentiment lexicon
#'
#' @param word character The word that we are looking for its sentiment
#'
#' @return list
#'
#' @examples
#' \dontrun{
#'  term_sentiment ("perfetto")
#'  term_sentiment ("non_funziona")
#' }
#'
#' @export
#'
term_sentiment <- function(word) {
  base::system.file("extdata", "lexicon.rds", package="sentimeter") %>%
    base::readRDS() ->
    lexicon
  sentiment <- c(0, 0, 0, 0, 0)
  iter <- 1
  for (term in lexicon$term) {
    if (term == word) {
      sentiment <- base::as.numeric(lexicon[iter, 2:6])
      break # if the word found in the lexicon, we're finished!
    }
    iter <- iter + 1
  }
  base::return(sentiment)
}
