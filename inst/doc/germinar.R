## ----setup, include = FALSE---------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")
# source("https://inkaverse.com/docs.r")

## ----echo = TRUE--------------------------------------------------------------
library(huito)

font <- c("Paytone One", "Permanent Marker")

huito_fonts(font)

label <- label_layout(size = c(5.08, 5.08)
                      , border_width = 0
                      , background = "#b1d842"
                      ) %>% 
  include_image(value = "https://germinar.inkaverse.com/img/seed_germination.png"
                , size = c(5.5, 5.5)
                , position = c(2.55, 1.26)
                , opts = 'image_transparent("white")*image_modulate(brightness = 0)'
                ) %>%
  include_shape(size = 5.08
                , border_width = 0
                , position = c(2.54, 2.54)
                , panel_color = "blue"
                ) %>%
  include_text(value = "GerminaR"
               , font[1]
               , size = 23
               , position = c(2.54, 3.55)
               , color = "#a64d79"
               ) %>%
  include_text(value = "inkaverse.com"
               , font[2]
               , size = 6
               , position = c(3.9, 0.96)
               , angle = 30
               , color = "white"
               )

## ---- echo = TRUE-------------------------------------------------------------
label %>% 
  label_print(mode = "preview")

## ---- echo = TRUE-------------------------------------------------------------
sticker <- label %>%
  label_print(filename = "GerminaR"
              , margin = 0
              , paper = c(5.5, 5.5)
              , mode = "complete"
              )

## ---- echo = TRUE-------------------------------------------------------------
sticker %>% 
  image_read_pdf()  %>% 
  image_crop(geometry = "600x600+40") %>%
  image_crop(geometry = "560x600-40") %>%
  image_transparent('blue') %>% 
  image_write("GerminaR.png")

## ----out.width = "35%"--------------------------------------------------------
include_graphics("GerminaR.png")

