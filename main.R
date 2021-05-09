library('plumber')

hackathon <- plumber::pr("termstar.R")

plumber::pr_run(hackathon, port=8080)