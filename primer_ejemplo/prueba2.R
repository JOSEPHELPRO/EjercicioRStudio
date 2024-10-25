numeros <- sample(1:1000, 180 )

resultado <- 0

for (i in 1:length(numeros)) {
  if (numeros[i] %% 2 == 0) {
    resultado[i] <- "par"
  } else {
    resultado[i] <- "impar"
  }
}

resultado