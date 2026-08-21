## ----setup, include = FALSE---------------------------------------------------
source("https://raw.githubusercontent.com/Flavjack/inti/master/pkgdown/favicon/docs.r")


## -----------------------------------------------------------------------------
library(huito)

font <- c("Permanent Marker")
huito_fonts(font)


## -----------------------------------------------------------------------------
label <- label_layout(size = c(5.08, 5.08)
                      , border_color = NA
                      , border_width = 0
                      , background = "#ffe701"
                      ) %>% 
  include_image(value = "logo_inkaverse.jpg" 
                , size = c(3.97, 3.97)
                , position = c(2.55, 2.06)
                ) %>%
  include_shape(size = 5.08
                , border_width = 3
                , border_color = "#505456"
                , position = c(2.54, 2.54)
                , panel_color = "blue"
                ) %>%
  include_text(value = "inkaverse.com"
               , size = 6
               , position = c(3.6, 0.75)
               , angle = 30
               , color = "white"
               , font = font[1]
               )


## -----------------------------------------------------------------------------
label %>% 
  label_print(mode = "preview")


## -----------------------------------------------------------------------------
sticker <- label %>%
  label_print(filename = "INKAVERSE"
              , margin = 0
              , paper = c(5.5, 5.5)
              , mode = "complete"
              )


## -----------------------------------------------------------------------------
sticker %>% 
  image_read_pdf()  %>% 
  image_crop(geometry = "600x600+40") %>%
  image_crop(geometry = "560x600-40") %>%
  image_transparent('blue') %>% 
  image_write("INKAVERSE.png")


## ----out.width = "35%"--------------------------------------------------------
include_graphics("INKAVERSE.png")

