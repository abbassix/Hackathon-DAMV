#' Document Sentiment
#'
#' Analyze the sentiment of a document using exclusive sentiment lexicon
#'
#' @param document character. The document that we want to analyze
#'
#' @return list
#'
#' @examples
#' \dontrun{
#'  document_sentiment ("Questa è una frase di esempio.")
#' }
#'
#' @export
#'
#' @importFrom magrittr '%>%'
#' @importFrom magrittr '%<>%'
#'
document_sentiment <- function(document) {
  italian_stopwords <- base::c("ad", "al, allo", "ai", "agli", "all", "agl", "alla", "alle", "con", "col", "coi", "da", "dal", "dallo", "dai", "dagli", "dall", "dagl", "dalla", "dalle", "di", "del", "dello", "dei", "degli", "dell", "degl", "della", "delle", "in", "nel", "nello", "nei", "negli", "nell", "negl", "nella", "nelle", "su", "sul", "sullo", "sui", "sugli", "sull", "sugl", "sulla", "sulle", "per", "tra", "contro", "io", "tu", "lui", "lei", "noi", "voi", "loro", "mio", "mia", "miei", "mie", "tuo", "tua", "tuoi", "tue", "suo", "sua", "suoi", "sue", "nostro", "nostra", "nostri", "nostre", "vostro", "vostra", "vostri", "vostre", "mi", "ti", "ci", "vi", "lo", "la", "li", "le", "gli", "ne", "il", "un", "uno", "una", "ma", "ed", "se", "perché", "anche", "come", "dov", "dove", "che", "chi", "cui", "più", "quale", "quanto", "quanti", "quanta", "quante", "quello", "quelli", "quella", "quelle", "questo", "questi", "questa", "queste", "si", "tutto", "tutti", "a", "c", "e", "i", "l", "o", "ho", "hai", "ha", "abbiamo", "avete", "hanno", "abbia", "abbiate", "abbiano", "avrò", "avrai", "avrà", "avremo", "avrete", "avranno", "avrei", "avresti", "c'è", "avrebbe", "avremmo", "avreste", "avrebbero", "avevo", "avevi", "aveva", "avevamo", "avevate", "avevano", "ebbi", "avesti", "ebbe", "avemmo", "aveste", "ebbero", "avessi", "avesse", "avessimo", "avessero", "avendo", "avuto", "avuta", "avuti", "avute", "sono", "sei", "è", "siamo", "siete", "sia", "siate", "siano", "sarò", "sarai", "sarà", "saremo", "sarete", "saranno", "sarei", "saresti", "sarebbe", "saremmo", "sareste", "sarebbero", "ero", "eri", "era", "eravamo", "eravate", "erano", "fui", "fosti", "fu", "fummo", "foste", "furono", "fossi", "fosse", "fossimo", "fossero", "essendo", "faccio", "fai", "facciamo", "fanno", "faccia", "facciate", "facciano", "farò", "farai", "farà", "faremo", "farete", "faranno", "farei", "posso", "faresti", "farebbe", "faremmo", "fareste", "farebbero", "facevo", "facevi", "faceva", "facevamo", "facevate", "facevano", "feci", "facesti", "fece", "facemmo", "faceste", "fecero", "facessi", "facesse", "facessimo", "facessero", "facendo", "sto", "stai", "sta", "stiamo", "stanno", "stia", "stiate", "stiano", "starò", "starai", "starà", "staremo", "starete", "staranno", "starei", "staresti", "starebbe", "staremmo", "stareste", "starebbero", "stavo", "stavi", "stava", "stavamo", "stavate", "stavano", "stetti", "stesti", "stette", "stemmo", "steste", "stettero", "stessi", "stesse", "stessimo", "stessero", "stando", "aver", "avere", "averlo", "perciò", "quindi", "qualcosa", "qualcuno", "state", "verso", "puo", "poi", "già", "essere", "ogni", "qualche", "far", "stata", "stato", "stesso", "stessa", "mai", "fare", "fari")
  compound_terms <- base::c('non', 'senza', 'molto', 'poco', 'troppo', 'smesso',
                            'tanto', 'abbastanza')
  document %>%
    base::tolower() %>%
    base::gsub('[^a-z \u00e0\u00e8\u00e9\u00ec\u00ed\u00ee\u00f2\u00f3\u00f9\u00fa]', ' ', .) %>%
    base::gsub('(\\s|^)nn ', 'non ', .) %>%
    base::gsub('(\\s|^). ', ' ', .) %>%
    base::gsub('\\s+', ' ', .) ->
    document
  words <- base::strsplit(document, ' ')
  sentimate <- 0
  compound_flag <- F
  compound_term <- base::character()
  effective_terms <- base::c()
  num_terms <- 0
  for (word in words[[1]]) {
    if (nchar(word) < 4 | word %in% italian_stopwords) {
      next
    }
    if (compound_flag == T) {  # change the word to its compound form if the flag is TRUE
      word <- base::paste0(compound_term, '_', word)
    }
    sentiment <- sentimeter::term_sentiment(word)
    if (sum(sentiment == c(0, 0, 0, 0, 0)) < 5) {
      sentimate <- sentimate + sentiment
      effective_terms <- base::append(effective_terms, word)  # list of the terms found in the lexicon
      num_terms <- num_terms + 1  # number of the terms found in the lexicon
    }
    if (word %in% compound_terms) {  # check if the word is one of the compound terms, turn the flag on, so the next word will be compounded
      compound_flag <- T   # be careful that the compound terms themselves should not be in the lexicon
      compound_term <- word
    } else {
      compound_flag <- F
    }
  }
  sentiment_report <- base::list("sentimate" = base::round(sentimate * 100 / base::sum(sentimate)),
                                 "num_terms" = num_terms,
                                 "effective_terms" = effective_terms)
  base::return(sentiment_report)
}
