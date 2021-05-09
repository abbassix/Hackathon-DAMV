utest <- function(x) {
  base::library(stats)

  uniform_dist_p <- c(0.20,0.20,0.20,0.20,0.20)
  return(stats::chisq.test(base::as.numeric(x), p = uniform_dist_p)['p.value'][[1]])
}
