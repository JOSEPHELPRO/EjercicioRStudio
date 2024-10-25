library(svDialogs)
N <- as.numeric(dlgInput("Introduce un número N:")$res)
if (is.na(N)) {
  cat("Por favor, introduce un número válido.\n")
} else {
  suma <- 0
  for (i in 1:N) {
    suma <- suma + i
  }
  
  cat("La suma de los primeros", N, "números es:", suma, "\n")
}


 

