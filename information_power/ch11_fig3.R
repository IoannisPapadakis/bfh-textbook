require(ggplot2)
require(shape)
pdf(file = "bfh-textbook/information_power/ch11_fig3.pdf", width = 9, height = 7)

#Set parameters for graphics
axislabelsize <- 1.5

#Parameters for figures
u1 <- 4
u2 <- 10
u3 <- 16
delta1 <- 2
delta2 <- 2
delta3 <- 2

indiffFn1 <- function(p, u1 = 4, delta1 = 2) {
  1 - (delta1) / (p - u1)
}

indiffFn2 <- function(p, u2 = 10, delta2 = 2) {
  1 - (delta2) / (p - u2)
}

indiffFn3 <- function(p, u3 = 16, delta3 = 2) {
  1 - (delta3) / (p - u3)
}

#The derivative for the function q = 1 - delta/(p - u) = delta/p - u)^2;
#From that we get the derivative and substitute in the relevant values
#for delta, u and p; that is we get a slope of 1/32
#But we also need the intercept; 0.375 above, or q/2 as it stood
tangentLine <- function(p){
  0.375 + (1/32)*p
}

COL <- c("#bae4b3", "#74c476", "#238b45")
par(mar =  c(5, 5, 4, 2))
xlims <- c(0, 40)
ylims <- c(0, 1.1)


plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste("Price, ", p)),
     ylab = expression(paste("Quality, ", q)),
     xaxt = "n", yaxt = "n", cex.lab = axislabelsize, bty = "n")

npts <- 500 
xx1 <- seq(u1 + delta1 + 0.1, xlims[2], length.out = npts)
xx2 <- seq(u2 + delta2 + 0.1, xlims[2], length.out = npts)
xx3 <- seq(u3 + delta3 + 0.1, xlims[2], length.out = npts)
xx4 <- seq(7, 17, 0.01)

#Draw the lines for the graphs
lines(xx1, indiffFn1(xx1), col = COL[1], lwd = 4)
lines(xx2, indiffFn2(xx2), col = COL[2], lwd = 4)
lines(xx3, indiffFn3(xx3), col = COL[3], lwd = 4)
lines(xx4, tangentLine(xx4), col = "darkgrey", lty = 2, lwd = 4)

#Customize ticks and labels for the plot
ticksy <- c(0, 1, 1.1)
ylabels <- c(0, 1, NA)
ticksx <- c(0, 40)
xlabels <- c(0, 40)
axis(1, at = ticksx, pos = 0, labels = xlabels)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1)

#Annotation of the three indifference curves
text(7, 0.05, expression(paste(u[1])))
text(13, 0.05, expression(paste(u[2])))
text(19, 0.05, expression(paste(u[3])))

#Line for the max quality, q = 1 
segments(0, 1, 40, 1, lty = 2, col = "darkgray", lwd = 2)
#Annotating line of 100% quality
text(20, 1.025, expression(paste("Maximum level of quality, q")))

#Add a point for the tangency
points(12, 0.75, pch = 16, col = "black", cex = 1.5)

#Arrow to Slope of BRF
Arrows(10, 0.8, 12, 0.8, col = "black", lty = 1, lwd = 1.5, arr.type = "triangle")
text(5, 0.8, expression(paste("Slope = MRS = ", -frac(1, u[q]))))
text(5.4, 0.73, expression(paste(" = ", frac(delta, (1-q)^2))))
dev.off()

