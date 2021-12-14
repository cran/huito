params <-
list(file = "huito")

## ----setup, include=FALSE-----------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")
# open https://docs.google.com/document/d/1U_06RwkOWavq2O9CY5j9GRd3_2Ik8OTrfszK-ccbGmQ/edit

## -----------------------------------------------------------------------------
file <- params$file
doc <- gdoc2rmd(file = paste0(file, ".zip"), export = file)

## ----idbl2tuxtg6f7n, out.width = "50%", fig.cap= 'El ***huito*** (*Genipa americana*) es una especie de árbol de la familia Rubiaceae. Originaria de los bosques tropicales de América. Los indígenas lo usan para realizar diseños en su cuerpo y teñir telares.'----

knitr::include_graphics('huito/img_0.jpg')


## ----kixvd7qxjm1q38u, fig.cap= 'Proceso de etiquetado y colecta de datos de experimentos. Los códigos QR permiten la colecta de datos con un dispositivo móvil de forma rápida y sencilla.'----

knitr::include_graphics('huito/img_1.png')


## ---- echo=FALSE, results='asis', eval=T--------------------------------------
res <- knitr::knit_child(doc, quiet = TRUE)
cat(res, sep = '\n')

