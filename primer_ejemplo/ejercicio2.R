numeros <- sample(1:1800, 100)


pares <- 0
impares <- 0

for (i in 1:length(numeros)) {
  if (numeros[i] %% 2 == 0) {
    pares <- pares + 1
  } else {
    impares <- impares + 1
  }
}

cat("Cantidad de números pares:", pares, "\n")
cat("Cantidad de números impares:", impares, "\n")