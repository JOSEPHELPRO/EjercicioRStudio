N <- as.numeric(readline(prompt = "Introduce un número N: "))

factorial <- 1
for (i in 1:N) {
  factorial <- factorial * i
}

cat("El factorial de", N, "es:", factorial, "\n")