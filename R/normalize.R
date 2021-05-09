# normalize by the row to sum up at 100%
normalize <- function(x) {
  return(round(x*100/sum(x), 2))
}
