library(raster)
library(jpeg)
library(mmand)

source(file = "imagemaster/grayscale.R")
source(file = "imagemaster/filter/filter.R")
source(file = "imagemaster/noice.R")

plotImage <- function(img, title) {
  res = dim(img)[2:1]
  plot(1,1,xlim=c(1,res[1]),ylim=c(1,res[2]),asp=1,bty='n', main=title )
  rasterImage(img,1,1,res[1],res[2])  
}

imgPath <- "noise/e.jpg";
img <- readJPEG(imgPath)
plotImage(img, "Original Image")

gimg <- Mrgb2grayscale(img)
plotImage(gimg, "Grayscale Image")

glimg <- Mrgb2grayscaleLightness(img)
plotImage(glimg, "Grayscale Image based on Lightness")

pepperNoicedImg <- addPepperNoice(gimg)
plotImage(pepperNoicedImg, "Paper noised image")

k = 3
t <- system.time(mImg <- MmedianFilter(pepperNoicedImg, k))
s = paste("Filtered with Median filter with size=", k ,". Time spent=", format(round(t[1], 2), nsmall = 2))
plotImage(mImg, s)

kernel <- shapeKernel(c(k,k), type="box")
t <- system.time(mmImg <- mmand::medianFilter(pepperNoicedImg, kernel))
s = paste("Filtered with mmand:Median filter with size=", k ,". Time spent=", format(round(t[1], 2), nsmall = 2))
plotImage(mmImg, s)







