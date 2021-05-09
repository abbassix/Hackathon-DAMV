txt <- "NON FATEVI FREGARE..!!!!!! ••• !!!...ATTENTI...NON SONO ORIGINALI MA LE SPACCIAN piu' e' molto"

# lower the characters
txt <- quanteda::char_tolower(txt)
txt
# italian characters
txt <- base::gsub("a'", 'à', txt)
txt
# italian characters
txt <- base::gsub("e'", 'è', txt)
txt
# italian characters
txt <- base::gsub("u'", 'ù', txt)
txt
# italian characters
txt <- base::gsub("o'", 'ò', txt)
txt
# convert any whitespace to proper space
txt <- base::gsub("(\\s)", ' ', txt)
txt
# remove any other characters than 'a-zàèéìíîòóùú .?!•' SHOULD we keep ':'?
txt <- base::gsub("[^a-zàèéìíîòóùú.?!• ]", ' ', txt)
txt
# remove any repetition of punctuation or space
txt <- base::gsub("([.?!•])+", '\\1', txt)
txt
# if there is any punctuation between word without space, then add space
txt <- base::gsub("([a-zàèéìíîòóùú])([.?!])([a-zàèéìíîòóùú])", '\\1\\2 \\3', txt)
txt
txt <- base::gsub(" [.?!]([a-zàèéìíîòóùú])", ' \\1', txt)
txt
# remove any space before punctuation!!!
txt <- base::gsub(" ([.?!])", '\\1', txt)
txt
#
#txt <- base::gsub(" [.?!]([a-zàèéìíîòóùú])", '\\1', txt)

# convert 'nn' to 'non'
txt <- base::gsub('(\\b)nn(\\b)', '\\1non\\2', txt)
txt
# to remove single characters; because l'[aiou]
txt <- base::gsub('\\b[a-zàèéìíîòóùú](\\b)', '\\1', txt)
txt
# remove noisy proper nouns (temporary)
txt <- base::gsub('(\\b)(pane|bialetti|alexa|caffè|mouse|smart|stick|fire|orologio|scooter|router|moka|moto|gioco|telecomando|borbone|nespresso|scarpe)\\b',
                            '\\1', txt)
txt
# mi meraviglia, mi fa meraviglia
txt <- base::gsub('(\\b)mi(?: [ a-zàèéìíîòóùú]+)? meravigli[aeimnostx]+?(\\b)', '\\1mi_meravigliX\\2', txt)
txt
# remove the 'aeio' ending of the words and put an 'X' instead
txt <- base::gsub('(\\b)(buon|perfett|ottim|pessim|buttat|discret|buonissim|funzion|rott|difettos|restituit|rimbors|delus|soddisfatt|insoddisfatt|sconsigliat|consigliat|scadent|eccellent|inutil|inutilizzabil|divertent|vocal|facil|consigli|sconsigli|blatt|truff|fantastic|consigliatissim|sconsigliatissim|delusion|ricomprat|comprat|funzionant|prodott|riprodott|compratel|rapport|rapportat|fregatur|segnal|acquist|bell|bellissim|soddisfattissim|meraviglios)[aeio](\\b)',
                            '\\1\\2X\\3', txt)
txt
#
txt <- base::gsub('(\\b)fantastiche(\\b)', '\\1fantasticx\\2', txt)
txt <- base::gsub('(\\b)schif(o|ezza)(\\b)', '\\1schifX\\2', txt)
txt <- base::gsub('(\\b)scarafaggi(o|)(\\b)', '\\1scarafaggiX\\2', txt)
txt <- base::gsub('(\\b)peggior(aei|)(\\b)', '\\1peggiorX\\2', txt)
txt <- base::gsub('(\\b)val(e|sa)\\s+la\\s+pena(aei|)(\\b)', '\\1vale_la_pena\\2', txt)
txt <- base::gsub('(\\b)vergogn[^a-zàèéìíîòóùú ]+?(\\b)', '\\1vergognX\\2', txt)
txt <- base::gsub(' +', ' ', txt)
txt
txt2 <- base::gsub('[^a-zàèéìíîòóùúX ]', '', txt)
txt2
txt2 <- base::gsub(' +', ' ', txt2)
txt2
