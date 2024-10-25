numero_secreto <- sample(1:100, 1)
adivinanza <- NA

while (is.na(adivinanza) || adivinanza != numero_secreto) {
 
  adivinanza <- as.integer(readline(prompt = "Adivina un número entre 1 y 100: "))
  
  if (is.na(adivinanza)) {
    cat("Por favor, ingresa un número válido.\n")
    next
  }
  
  if (adivinanza < numero_secreto) {
    cat("El número es mayor que", adivinanza, "\n")
  } else if (adivinanza > numero_secreto) {
    cat("El número es menor que", adivinanza, "\n")
  } else {
    cat("¡Felicidades! Adivinaste el número:", numero_secreto, "\n")
  }
}

