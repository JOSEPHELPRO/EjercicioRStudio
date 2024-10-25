numero <- as.integer(readline(prompt = "Introduce un número: "))
suma_digitos <- 0

while (numero > 0) {
  suma_digitos <- suma_digitos + (numero %% 10)
  numero <- numero %/% 10
}

cat("La suma de los dígitos es:", suma_digitos, "\n")