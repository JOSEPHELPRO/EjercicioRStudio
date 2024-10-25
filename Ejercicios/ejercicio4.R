a <- 0
b <- 1

contador <- 2
cat(a, b, "")
while (contador < 20) {
  siguiente <- a + b
  cat(siguiente, "")
  a <- b
  b <- siguiente
  contador <- contador + 1
}