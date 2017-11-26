addPepperNoice <- function(img) {
  d = dim(img)
  t = matrix((sample.int(10, size = d[1]*d[2], replace = TRUE) - 1), d[1], d[2]);
  noice = sign(t)*img;
}