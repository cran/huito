## ----setup--------------------------------------------------------------------
#| include: false

source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")
# https://docs.google.com/document/d/1U_06RwkOWavq2O9CY5j9GRd3_2Ik8OTrfszK-ccbGmQ/edit?usp=sharing


## -----------------------------------------------------------------------------
#| results: asis
#| out-width: 70%

"huito-package.md" %>% 
  inti::rticle(file = .
               , export = tempfile("article.qmd")
               ) %>% 
  knitr::knit_child(quiet = TRUE) %>% 
  cat(sep = '\n')

