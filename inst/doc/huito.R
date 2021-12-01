params <-
list(file = "huito")

## ----setup, include=FALSE-----------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")
# open https://docs.google.com/document/d/1U_06RwkOWavq2O9CY5j9GRd3_2Ik8OTrfszK-ccbGmQ/edit

## ---- include=FALSE-----------------------------------------------------------

gdoc_rticle <- function(file
                        , export = "files"
                        , md = TRUE
                        ){
  
  figure_md <- function(text
                        , path = export
                        , opts = NA
                        ) {
    
    opt <- text %>% 
      tibble::enframe() %>% 
      tidyr::separate_rows(.data$value, sep = "^(\\!\\[)") %>% 
      tidyr::separate_rows(.data$value, sep = "(\\]\\()") %>% 
      tidyr::separate_rows(.data$value, sep = "(\\)\\{)") %>% 
      tidyr::separate_rows(.data$value, sep = "(\\{)") %>% 
      tidyr::separate_rows(.data$value, sep = "(\\})") %>% 
      dplyr::na_if("") %>% 
      tidyr::drop_na(.data$value) %>% 
      tibble::rownames_to_column() %>% 
      dplyr::mutate(type = dplyr::case_when(
        grepl("img_", .data$value) ~ "figure"
        , grepl("#fig", .data$value) ~ "id"
        , rowname %in% 1 ~ "title"
        , TRUE ~ "options"
      )) %>% 
      dplyr::select(.data$type, .data$value) %>% 
      tibble::deframe() %>% 
      as.list()
    
    if(!is.na(opts)) {
      opt$options <- opts
    }
    
    fig <- paste0(
      "\n\n"
      , "```{r "
      , opt$options
      , ", fig.cap= '"
      , opt$title %>% trimws()
      , "'}\n\n"
      , "knitr::include_graphics('"
      , paste0(path, "/", opt$figure)
      , "')\n\n```"
    ) 
    
    fig
    
  }
  
# unzip files -------------------------------------------------------------

  zip <- file %>% 
    utils::unzip(overwrite = T, exdir = export)
  
  doc <- zip %>% 
    .[grep('.md', .)] %>%
    readLines() %>% 
    tibble::enframe() %>%
    dplyr::rowwise() %>%
    dplyr::mutate(text = dplyr::case_when(
      grepl(pattern = "#fig:", value) ~ value %>% figure_md(path = export)
      , TRUE ~ value
    )) %>% 
    dplyr::select(.data$text) %>% 
    tibble::deframe() %>% 
    writeLines(con = paste0(export,"/_doc.Rmd"))
  
  doc <- list.files(path = export, pattern = "_doc", full.names = T)

}

## -----------------------------------------------------------------------------
dir <- params$file
doc <- gdoc_rticle(file = "huito.zip"
                   , export = dir
                   )

## ----out.width = "50%", fig.cap= 'El ***huito*** (*Genipa americana*) es una especie de árbol de la familia Rubiaceae. Originaria de los bosques tropicales de América del Norte y del Sur. Los indígenas lo usan para realizar diseños en su cuerpo y teñir telares.'----

knitr::include_graphics('huito/img_0.jpg')


## ----eval = T, fig.cap= 'Proceso de etiquetado y colecta de datos de experimentos. Los códigos QR permiten la colecta de datos con un dispositivo móvil de forma rápida y sencilla.'----

knitr::include_graphics('huito/img_1.png')


## ---- echo=FALSE, results='asis', eval=T--------------------------------------
res <- knitr::knit_child(doc, quiet = TRUE)
cat(res, sep = '\n')

