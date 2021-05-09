#' Sentiment Analysis
#'
#' Analyze the sentiment of reviews using exclusive sentiment lexicon and reports them
#'
#' @param reviews data.frame
#' \describe{
#'   \item{text}{Content of the review}
#'   \item{star}{Number of stars}
#' }
#'
#' @examples
#' \dontrun{
#'  sentiment_analysis("8845290034", 1)
#' }
#'
#' @export
#'
#' @importFrom magrittr '%>%'
#'
sentiment_analysis <- function (reviews) {
  i <- 1
  base::cat('\n\n')
  for (review in reviews$text) {
    report <- sentimeter::document_sentiment(review)
    base::cat('---------------------------------\n')
    base::writeLines(base::strwrap(review, width=70))
    base::cat('\n')
    if (report$sentimate != 0) {
      base::cat('Sentimate: ')
      base::cat(base::paste0('with ', report$sentimate[5], '% probability \u2605\u2605\u2605\u2605\u2605'))
      base::cat(base::paste0('with ', report$sentimate[4], '% probability \u2605\u2605\u2605\u2605\u2606'))
      base::cat(base::paste0('with ', report$sentimate[3], '% probability \u2605\u2605\u2605\u2606\u2606'))
      base::cat(base::paste0('with ', report$sentimate[2], '% probability \u2605\u2605\u2606\u2606\u2606'))
      base::cat(base::paste0('with ', report$sentimate[1], '% probability \u2605\u2606\u2606\u2606\u2606'))
      base::cat('\n')
      base::cat('First five effective terms: ')
      base::cat(base::paste0(utils::head(report$effective_terms, 5), ', '))
    } else {
      base::writeLines(base::strwrap('Unfortunately we could not detect any sentimentally significant term! This could be result of a very short review or a review in another language.', width=70))
    }
    base::cat('\n')
    base::cat(base::paste0('Given star(s): ', reviews$star[i]))
    base::cat('\n')
    i <- i + 1
  }
}
