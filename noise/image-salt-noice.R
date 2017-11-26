library(raster)
library(jpeg)
library(mmand)



source(file = "imagemaster/grayscale.R")
#source(file = "imagemaster/filter/filter.R")
source(file = "imagemaster/noice.R")

MmedianFilter <- function(img, kernelSize) {
  kr <- (kernelSize + 1)/2
  d <- dim(img)
  fimg <- matrix(0, d[1], d[2])
  lx <- kr + 1
  rx <- d[1] - kr
  by <- kr + 1
  uy <- d[2] - kr
  for (i in lx:300) {
    for(j in by:300) {
      subimg <- img[i-kr:i+kr, j-kr:j+kr]
      m <- median(subimg)
      fimg[i,j] <- m
    }
  }
  return(fimg)
}

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

#mImg <- MmedianFilter(pepperNoicedImg, 3)
k <- shapeKernel(c(3,3), type="box")
mImg <- mmand::medianFilter(pepperNoicedImg, k)
plotImage(mImg, "Filtered with Median filter with size 3")

mmImg <- mmand::medianFilter(mImg, k)
plotImage(mmImg, "Second time Filtered with Median filter with size 3")
mmmImg <- mmand::medianFilter(mImg, k)
plotImage(mmmImg, "Third time Filtered with Median filter with size 3")







