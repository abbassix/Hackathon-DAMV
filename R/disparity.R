disparity <- function(corp, dist, term) {
  source('distribution.R')
  disp <- t(data.frame(as.list(distribution(corp=corp, dist=dist, star=1))))
  disp <- base::cbind(disp, as.list(distribution(corp=corp, dist=dist, star=2)))
  disp <- base::cbind(disp, as.list(distribution(corp=corp, dist=dist, star=3)))
  disp <- base::cbind(disp, as.list(distribution(corp=corp, dist=dist, star=4)))
  disp <- base::cbind(disp, as.list(distribution(corp=corp, dist=dist, star=5)))
  base::colnames(disp) <- base::c('one', 'two', 'three', 'four', 'five')
  #disp <- as.data.frame(disp)
  disp <- transform(disp,
                    one = as.numeric(one),
                    two = as.numeric(two),
                    three = as.numeric(three),
                    four = as.numeric(four),
                    five = as.numeric(five))
  return(disp)
}
