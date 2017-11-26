library(raster)
library(jpeg)
source(file = "imagemaster/grayscale.R")

imgPath <- "noise/i.jpg";
img <- readJPEG(imgPath)
res = dim(img)[2:1]
plot(1,1,xlim=c(1,res[1]),ylim=c(1,res[2]),asp=1,bty='n', main="Original Image" )
rasterImage(img,1,1,res[1],res[2])

gimg = Mrgb2grayscale(img)
plot(1,1,xlim=c(1,res[1]),ylim=c(1,res[2]),asp=1,bty='n', main="Grayscale Image" )
rasterImage(gimg,1,1,res[1],res[2])

glimg = Mrgb2grayscaleLightness(img)
plot(1,1,xlim=c(1,res[1]),ylim=c(1,res[2]),asp=1,bty='n', main="Grayscale Image based on Lightness" )
rasterImage(glimg,1,1,res[1],res[2])







