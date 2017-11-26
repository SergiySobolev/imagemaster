Mrgb2grayscale <- function(img) {
  Rcoef = 0.2126
  Gcoef = 0.7152
  Bcoef = 0.0722
  gimg = img[, , 1] * Rcoef + img[, , 2] * Gcoef + img[, , 3] * Bcoef 
}

Mrgb2grayscaleLightness <- function(img) {
  gimg = (pmin(img[, , 1], img[, , 2], img[, , 3]) + pmax(img[, , 1], img[, , 2], img[, , 3]))/2
}



