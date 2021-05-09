process <- function(corp){
  corp$preprocessed <- base::gsub('[^a-zàèéìíîòóùúX_ ]', '', corp$textitle)
  corp$preprocessed <- base::gsub(' +', ' ', corp$preprocessed)
  corp <- corp[!(corp$preprocessed==' ' | corp$preprocessed=='o ' | corp$preprocessed=='e '), ]
  return(corp)
}
