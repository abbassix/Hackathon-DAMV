pre_process <- function(corp) {
  base::library(quanteda)

  # ignore emojis for the moment

  # join title and text by ' • '
  corp$textitle <- base::as.character(base::paste0(corp$title, ' • ', corp$text))

  # lower the characters
  corp$textitle <- quanteda::char_tolower(corp$textitle)

  # italian characters
  corp$textitle <- base::gsub("a'", 'à', corp$textitle)

  # italian characters
  corp$textitle <- base::gsub("e'", 'è', corp$textitle)

  # italian characters
  corp$textitle <- base::gsub("u'", 'ù', corp$textitle)

  # italian characters
  corp$textitle <- base::gsub("o'", 'ò', corp$textitle)

  # convert any whitespace to proper space
  corp$textitle <- base::gsub("(\\s)", ' ', corp$textitle)

  # remove any other characters than 'a-zàèéìíîòóùú .?!•' SHOULD we keep ':'?
  corp$textitle <- base::gsub("[^a-zàèéìíîòóùú.?!• ]", ' ', corp$textitle)

  # remove any repetition of punctuation or space
  corp$textitle <- base::gsub("([ .?!•])+", '\\1', corp$textitle)

  # if there is any punctuation between word without space, then add space
  corp$textitle <- base::gsub("([a-zàèéìíîòóùú])([.?!])([a-zàèéìíîòóùú])", '\\1\\2 \\3', corp$textitle)

  # any punctuation as a prefix for a word should be removed
  corp$textitle <- base::gsub(" [.?!]([a-zàèéìíîòóùú])", ' \\1', corp$textitle)

  # remove any space before punctuation
  corp$textitle <- base::gsub(" ([.?!])", '\\1', corp$textitle)

  #
  #corp$textitle <- base::gsub(" [.?!]([a-zàèéìíîòóùú])", '\\1', corp$textitle)

  # convert 'nn' to 'non'
  corp$textitle <- base::gsub('(\\b)nn(\\b)', '\\1non\\2', corp$textitle)

  # to remove single characters; because l'[aiou]
  corp$textitle <- base::gsub('\\b[a-zàèéìíîòóùú](\\b)', '\\1', corp$textitle)

  # remove noisy proper nouns (temporary)
  corp$textitle <- base::gsub('(\\b)(pane|bialetti|alexa|caffè|mouse|smart|stick|fire|orologio|scooter|router|moka|moto|gioco|telecomando|borbone|nespresso|scarpe)\\b',
                              '\\1', corp$textitle)

  # mi meraviglia, mi fa meraviglia
  corp$textitle <- base::gsub('(\\b)mi(?: [ a-zàèéìíîòóùú]+)? meravigli[aeimnostx]+?(\\b)', '\\1mi_meravigliX\\2', corp$textitle)

  # remove the 'aeio' ending of the words and put an 'X' instead
  corp$textitle <- base::gsub('(\\b)(buon|perfett|ottim|pessim|buttat|discret|buonissim|funzion|rott|difettos|restituit|rimbors|delus|soddisfatt|insoddisfatt|sconsigliat|consigliat|scadent|eccellent|inutil|inutilizzabil|divertent|vocal|facil|consigli|sconsigli|blatt|truff|fantastic|consigliatissim|sconsigliatissim|delusion|ricomprat|comprat|funzionant|prodott|riprodott|compratel|rapport|rapportat|fregatur|segnal|acquist|bell|bellissim|soddisfattissim|meraviglios)[aeio](\\b)',
                              '\\1\\2X\\3', corp$textitle)

  #
  corp$textitle <- base::gsub('(\\b)fantastiche(\\b)', '\\1fantasticx\\2', corp$textitle)
  corp$textitle <- base::gsub('(\\b)schif(o|ezza)(\\b)', '\\1schifX\\2', corp$textitle)
  corp$textitle <- base::gsub('(\\b)scarafaggi(o|)(\\b)', '\\1scarafaggiX\\2', corp$textitle)
  corp$textitle <- base::gsub('(\\b)peggior(aei|)(\\b)', '\\1peggiorX\\2', corp$textitle)
  corp$textitle <- base::gsub('(\\b)val(e|sa)\\s+la\\s+pena(aei|)(\\b)', '\\1vale_la_pena\\2', corp$textitle)
  corp$textitle <- base::gsub('(\\b)vergogn[^a-zàèéìíîòóùú ]+?(\\b)', '\\1vergognX\\2', corp$textitle)
  corp$textitle <- base::gsub(' +', ' ', corp$textitle)
  return(corp)
}
