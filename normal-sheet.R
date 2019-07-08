windowsFonts(B = windowsFont("Symbol"))
x <- c(0.5, 1, 2.5, 5, 10, 25, 50, 75, 90, 95, 97.5, 99, 99.5)
# png(file = "z-curve.png", width = 740, height = 380)
# pdf(file = "z-curve.pdf")
# pdf(file = "z-curve.pdf", width = 6, height = 3.5)
par(mar = c(6, 3, 1, 2) + 0.1)
curve(dnorm(x), -3.2, 3.2, xlab = "", ylab = "", yaxt = "n", xaxt = "n", 
      lwd = 2, bty = "n")
axis(1, seq(-3, 3), cex.axis = 1.00, family = "B")
Hmisc::minor.tick(nx = 10, ny = 1)
axis(1, qnorm(x / 100), labels = x, line = 4, cex.axis = 0.95,
     tck = 0.01, mgp = c(3, 0.25, 0), font = 2)
# mtext("Percent", 3, line = 0.5, at = -3.4)

# "ideal" normal histogram
z_dat <- data.frame(z = c(
  rep(-2.5, 1), rep(-2, 3), rep(-1.5, 8), rep(-1, 12), rep(-0.5, 15),
  rep(0, 18),
  rep(0.5, 15), rep(1, 12), rep(1.5, 8), rep(2, 3), rep(2.5, 1)))

library(mosaic)
histogram(~z, z_dat, nint = 11, density = TRUE, fit = "normal")
