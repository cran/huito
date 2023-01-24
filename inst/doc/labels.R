## ----setup, include = FALSE---------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")

## ---- echo = TRUE-------------------------------------------------------------
library(inti)

treats <- data.frame(condition = c("irrigated", "drought")
                     , genotypes = c("choclito", "salcedo", "pandela", "puno"))

fb <- tarpuy_design(data = treats
                        , nfactors = 2
                        , type = "rcbd"
                        , rep = 3
                        , fbname = "HUITO") 

fb %>% web_table()

## ---- echo = TRUE-------------------------------------------------------------
library(huito)

font <- c('Ceviche One', "Permanent Marker")

huito_fonts(font)

label <- fb %>% 
  mutate(color = case_when(
    condition %in% "irrigated" ~ "blue"
    , condition %in% "drought" ~ "red"
  )) %>% 
  label_layout(size = c(10, 2.5)
               , border_color = "blue"
               ) %>%
  include_image(
    value = "https://flavjack.github.io/inti/img/inkaverse.png"
    , size = c(2.4, 2.4)
    , position = c(1.2, 1.25)
    , opts = "image_scale(200)"
    ) %>%
  include_barcode(
     value = "barcode"
     , size = c(2.5, 2.5)
     , position = c(8.2, 1.25)
     ) %>%
  include_text(value = "plots"
               , position = c(9.7, 1.25)
               , angle = 90
               , size = 15
               , color = "red"
               ) %>%
  include_text(value = "Inkaverse"
               , position = c(4.6, 2)
               , size = 30
               , color = "brown"
               , font[1]
               ) %>%
  include_text(value = "condition"
               , position = c(4.6, 1.2)
               , size = 13
               , color = "color" # dynamic column
               , font[2]
               ) %>%
  include_text(value = "genotypes"
               , position = c(4.6, 0.5)
               , size = 13
               , color = "#009966"
               , font[2]
               ) 

## ----echo = TRUE--------------------------------------------------------------
label %>% 
  label_print(mode = "preview")

## ----echo = TRUE--------------------------------------------------------------
label %>% 
  label_print(mode = "complete", filename = "etiquetas", nlabels = 10)

