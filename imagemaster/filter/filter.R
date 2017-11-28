MmedianFilter <- function(img, kernelSize) {
  
  d <- dim(img)
  imgcj <- CJ(1:nrow(img), 1:ncol(img))
  mymedian <- function(v, m, k) {
    i = v[1]
    j = v[2]
    k <- k/2
    if (i>k && j>k && i<nrow(m)-k+1 && j<ncol(m)-k+1) {
      subimg <- c (
        m[i-1, j-1], m[i-1, j], m[i-1,j+1],
        m[i,   j-1], m[i,   j], m[i,  j+1],
        m[i+1, j-1], m[i+1, j], m[i+1,j+1]
      )
      # subimg <- vector()
      # for(l in -k:k) {
      #   for(u in -k:k) {
      #     p <- subimg
      #     subimg <- c(p, m[i+l,j+u])  
      #   }
      # }
      r <- median(subimg)
    } else {
      r = m[i,j]
    }
    return(r)
  }
  f <- apply(X = imgcj, MARGIN = 1, FUN = mymedian, m=img, k=kernelSize)
  f <- matrix(f, nrow(img), ncol(img), byrow = TRUE);
  return(f)
}