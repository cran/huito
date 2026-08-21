## ----setup--------------------------------------------------------------------
#| include: false
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")


## -----------------------------------------------------------------------------
library(inti)

treats <- data.frame(condition = c("irrigated", "drought")
                     , genotypes = c("choclito", "salcedo", "pandela", "puno"))

fb <- tarpuy_design(data = treats
                    , nfactors = 2
                    , type = "rcbd"
                    , rep = 3
                    , project = "inkaverse"
                    ) 

fb %>% web_table()


## -----------------------------------------------------------------------------
library(huito)

font <- c("Permanent Marker", "Tillana", "Courgette")

huito_fonts(font)


## -----------------------------------------------------------------------------
label <- fb %>%  
  label_layout(size = c(10, 2.5)
               , border_color = "blue"
               ) %>%
  include_image(
    value = "https://flavjack.github.io/inti/img/inkaverse.png"
    , size = c(2.1, 2.4)
    , position = c(1.2, 1.25)
    # , opts = list("image_scale(200)", "image_noise()")
    ) %>%
  include_barcode(
     value = "barcode"
     , size = c(2.5, 2.5)
     , position = c(8.2, 1.25)
     ) %>%
  include_text(value = "INKAVERSE"
               , position = c(4.6, 2)
               , size = 20
               , font = font[1]
               , fontface = "bold"
               ) %>%
  include_text(value = "condition"
               , position = c(2.4, 1.2)
               , size = 12
               , font = font[2]
               , opts = list(hjust = 0.0, vjust = 0.0) 
               , prefix = "Irrigation: "
               , fontface = "bold"
               ) %>%
  include_text(value = "genotypes"
               , position = c(2.4, 0.5)
               , size = 12
               , color = "#009966"
               , font = font[2]
               , opts = list(hjust = 0.0, vjust = 0.0)
               , prefix = "Genotipo: "
               , fontface = "bold"
               ) %>% 
  include_text(value = "plots"
               , position = c(9.7, 1.25)
               , angle = 90
               , size = 12
               , color = "red"
               , font = font[3]
               , prefix = "Plot: "
               ) 


## -----------------------------------------------------------------------------
label %>% 
  label_print(mode = "preview")


## -----------------------------------------------------------------------------
label %>% 
  label_print(mode = "complete", filename = "horizontal"
              , nlabels = 10)

