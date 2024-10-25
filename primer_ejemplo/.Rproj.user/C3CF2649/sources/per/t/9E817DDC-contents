contrasena_correcta <- "jose1234"
intentos <- 0
max_intentos <- 3
while (intentos < max_intentos) {
  contrasena_ingresada <- readline(prompt = "Ingresa la contraseña: ")
  if (contrasena_ingresada == contrasena_correcta) {
    cat("¡Contraseña correcta! Bienvenido.\n")
    break
  } else {
    intentos <- intentos + 1
    cat("Contraseña incorrecta. Intentos restantes:", max_intentos - intentos, "\n")
    if (intentos == max_intentos) {
      cat("Has sido bloqueado por exceder el número de intentos.\n")
    }
  }
}
