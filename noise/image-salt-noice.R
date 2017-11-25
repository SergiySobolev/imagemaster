library(imager)
library(raster)
library(spatialfil)

tograyscale <- function(i) {
  grayscale(i)
}

imgPath <- "noise/i.jpg";
i <- load.image(imgPath)
gi <- tograyscale(i)
m <- as.matrix(gi)
flt <- as.cimg(matrix(1,4,4)/16)
fi <- convolve(gi,flt)


  


kernel <- convKernel(sigma = 1.4, k = 'gaussian')
#fi = applyFilter(m, kernel);

plot(i,main="Original")
plot(gi, main="To Grayscale")
plot(image(m), main="Blurred")




