edad<-rnorm(200, 2000, 10)

mayores <- 0
for (j in 1:length(edad)) {
  if (edad[j] <= 2006) {
    mayores[j] <- "si"
  } else if (edad[j] >= 2010) {
    mayores[j] <- "niño"
  } else {
    mayores[j] <- "no"
  }
}

mayores



