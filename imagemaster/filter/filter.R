MMmedianFilter <- function(img, kernelSize) {
  kernelRadius <- (kernelSize + 1)/2
  d <- dim(img)
  fimg = matrix(0, d[1], d[2])
  for (i in 2:d[1]-1) {
    for(j in 2:d[2]-1) {
      sumimg = img(i-1:i+1, j-1:j+1)
      m = median(sumimg)
      fimg[i,j] = m
    }
  }
  return(fimg)
}