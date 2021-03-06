require(ggplot2)
require(shape)
pdf(file = "society_fig3.pdf", width = 9, height = 7)

#Set parameters for graphics
axislabelsize <- 1.5
par(mar =  c(5, 5, 4, 2))
xlims <- c(0, 5)
ylims <- c(0, 5)

#Plot command 
plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste("Bob's Payoff, ", B)),
     ylab = expression(paste("Alfredo's Payoff, ", A)),
     xaxt = "n", yaxt = "n", cex.lab = axislabelsize, bty = "n")


#Customize ticks and labels for the plot
ticksy <- seq(0, 5, 1)
ylabels <- seq(0, 5, 1)
ticksx <- seq(0, 5, 1)
xlabels <- seq(0, 5, 1)
axis(1, at = ticksx, pos = 0, labels = xlabels)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1)


#Lines for the coordinates of the Nash equilbrium
segments(1, 4, 4, 1, lty = 1, col = "#7fc97f", lwd = 4)

#Add points a, b, c and c
points(1, 4, pch = 16, col = "black", cex = 1.5)
text(1.1, 4.1, expression(paste("a")))
points(2, 3, pch = 16, col = "black", cex = 1.5)
text(2.1, 3.1, expression(paste("b")))
points(3, 2, pch = 16, col = "black", cex = 1.5)
text(3.1, 2.1, expression(paste("c")))
points(4, 1, pch = 16, col = "black", cex = 1.5)
text(4.1, 1.1, expression(paste("d")))

#Label utility possibilities frontier
text(3.8, 1.9, expression(paste("Utility Possibilities")))
text(3.8, 1.65, expression(paste("Frontier")))

dev.off()

