term_cleaner <- function(term) {
  base::library(quanteda)

  term <- quanteda::char_tolower(term)
  
  # italian characters
  term <- base::gsub("a'", 'à', term)
  
  # italian characters
  term <- base::gsub("e'", 'è', term)
  
  # italian characters
  term <- base::gsub("u'", 'ù', term)
  
  # italian characters
  term <- base::gsub("o'", 'ò', term)
  
  # convert any whitespace to proper space
  term <- base::gsub("\\s+", '', term)
  
  # remove any other characters than 'a-zàèéìíîòóùú .?!•' SHOULD we keep ':'?
  term <- base::gsub("[^a-zàèéìíîòóùú ]", '', term)
  
  # mi meraviglia, mi fa meraviglia
  term <- base::gsub('(\\b)mi(?: [ a-zàèéìíîòóùú]+)? meravigli[aeimnostx]+?(\\b)', '\\1mi_meravigliX\\2', term)
  
  # remove the 'aeio' ending of the words and put an 'X' instead
  term <- base::gsub('(\\b)(buon|perfett|ottim|pessim|buttat|discret|buonissim|funzion|rott|difettos|restituit|rimbors|delus|soddisfatt|insoddisfatt|sconsigliat|consigliat|scadent|eccellent|inutil|inutilizzabil|divertent|vocal|facil|consigli|sconsigli|blatt|truff|fantastic|consigliatissim|sconsigliatissim|delusion|ricomprat|comprat|funzionant|prodott|riprodott|compratel|rapport|rapportat|fregatur|segnal|acquist|bell|bellissim|soddisfattissim|meraviglios)[aeio](\\b)',
                              '\\1\\2X\\3', term)
  
  #
  term <- base::gsub('(\\b)fantastiche(\\b)', '\\1fantasticx\\2', term)
  term <- base::gsub('(\\b)schif(o|ezza)(\\b)', '\\1schifX\\2', term)
  term <- base::gsub('(\\b)scarafaggi(o|)(\\b)', '\\1scarafaggiX\\2', term)
  term <- base::gsub('(\\b)peggior(aei|)(\\b)', '\\1peggiorX\\2', term)
  term <- base::gsub('(\\b)val(e|sa)\\s+la\\s+pena(aei|)(\\b)', '\\1vale_la_pena\\2', term)
  term <- base::gsub('(\\b)vergogn[^a-zàèéìíîòóùú ]+?(\\b)', '\\1vergognX\\2', term)
  term <- base::gsub(' +', '', term)
  return(term)
}
