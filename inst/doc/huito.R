params <-
list(file = "huito")

## ----setup, include=FALSE-----------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")
# open https://docs.google.com/document/d/1U_06RwkOWavq2O9CY5j9GRd3_2Ik8OTrfszK-ccbGmQ/edit

## -----------------------------------------------------------------------------
file <- params$file
doc <- gdoc2rmd(file = paste0(file, ".zip"), export = file)

## -----------------------------------------------------------------------------
knitr::include_graphics('huito/img_0.jpg')

## -----------------------------------------------------------------------------
knitr::include_graphics('huito/img_1.png')

## ---- echo=FALSE, results='asis', eval=T--------------------------------------
res <- knitr::knit_child(doc, quiet = TRUE)
cat(res, sep = '\n')

