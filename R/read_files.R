read_files <- function(path) {
  corp <- base::lapply(list.files(path= path, full.names=T),
                       function(i) {
                         utils::read.csv(i, header=F, skip=1)
                       }
  )
  corp <- base::do.call(base::rbind.data.frame, corp)
  corp <- base::subset(corp, select=base::c(V2, V3, V4))
  base::colnames(corp) <- base::c("title", "text", "star")
  return(corp[!duplicated(corp$text), ])
}
