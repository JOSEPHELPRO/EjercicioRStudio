N <- as.numeric(dlgInput("Introduce un número N:")$res)

factorial <- 1
for (i in 1:N) {
  factorial <- factorial * i
}

cat("El factorial de", N, "es:", factorial, "\n")
