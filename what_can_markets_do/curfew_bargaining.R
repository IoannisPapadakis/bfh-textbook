#Graph Designer: Simon Halliday
#Authors: Bowles, Foley and Halliday
#Title: Coordination, Conflict and Competition: A Text in Microeconomics

library(shape)
pdf(file = "what_can_markets_do/curfew_bargaining.pdf", width = 10, height = 8)

#Set parameters for graphics
axislabelsize <- 1.5
labelsize <- 1.1
graphlinewidth <- 3
segmentlinewidth <- 2

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#4eb3d3", "#2b8cbe", "#0868ac","#084081")

#Edited the margins to cater for the larger LHS labels
par(mar =  c(6, 6, 4, 4))

#proportion of wealth functions

MUb <- function(x, beta = 1/2, Tb = 9){
  2*beta*(Tb - x)
}

MUa <- function(x, alpha = 1/2, Ta = 3){
  -2*alpha*(Ta - x)
}


#Add limits on axes and levels of utility for each function 
ylims <- c(0, 6.75)
xlims <- c(3, 9)

npts <- 501 
x <- seq(xlims[1], xlims[2], length.out = npts)
y <- seq(ylims[1], ylims[2], length.out = npts) 

plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")), 
     xaxt = "n", 
     yaxt = "n", 
     cex.lab = axislabelsize, 
     bty = "n", 
     xaxs="i", 
     yaxs="i"
)

#x and y limits with plain axes without ticks/numbers to match previous graph; y axes on both sides

ticksx <- c(3, 6, 7.5, 9)
xlabels <- c(expression(paste(T[a])), expression(paste("x*")), expression(paste(x*minute)), expression(paste(T[b])))
ticksy <- c(0, MUa(x = 7.5), MUa(x = 6), MUb(x = 7.5), ylims[2])

ylabels <- c(NA, expression(paste(-u[x]^A*(x*minute))), expression(paste(-u[x]^A == u[x]^B)), expression(paste(u[x]^B*(x*minute))), NA)
ticksy2 <- c(ylims[1], ylims[2])
ylabels2 <- seq(from = 0, to = ylims[2], by = 10)
axis(1, at = ticksx,  pos = 0, labels = xlabels)
axis(2, at = ticksy,  pos = 3, labels = ylabels, las = 1)
axis(4, at = ticksy2, pos = 9, labels = FALSE, las=1)


#Disutility polygon
xrent <- c(3, 6, 9, 3)
yrent <- c(MUa(3), MUa(6), MUb(9), MUa(3))
polygon(xrent, yrent, col=COL[4], density = NULL, border = NA)


npts <- 503 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)
xx2 <- seq(0, xlims[2], length.out = npts)
xx3 <- seq(xlims[1], 0, length.out = npts)
xx4 <- seq(-11, 0, length.out = npts)

#Axis labels and draw linear utility functions
text(6, -1, expression(paste("Curfew, x")), xpd = TRUE, cex = axislabelsize, srt = 0) 
#text(, side = 1, line = 2, cex = axislabelsize)
text(xlims[1] - 0.75, 0.5*ylims[2], expression(paste("Disutility")), xpd = TRUE, cex = axislabelsize, srt = 90) 

lines(xx1, MUb(xx1), col = COLB[4], lwd = graphlinewidth)
lines(xx1, MUa(xx1), col = COLA[5], lwd = graphlinewidth)
lines(xx1, MUa(xx1, alpha = 3/4), col = COLA[5], lwd = segmentlinewidth, lty = 2)
lines(xx1, MUb(xx1, beta = 1/4), col = COLB[4], lwd = segmentlinewidth, lty = 2)

#Label points on line

text(6, MUa(6) + 0.2, expression(paste(i)), cex = labelsize)
segments(6, 0, 6, MUa(6), lty = 2, col = "gray", lwd = segmentlinewidth)
segments(0, MUa(6), 6, MUa(6), lty = 2, col = "gray", lwd = segmentlinewidth)
points(6, MUa(6), pch = 16, col = "black", cex = 1.5)

text(7.5 + 0.1, MUa(7.5) - 0.1, expression(paste(g)), cex = labelsize)
segments(7.5, MUb(7.5), 0, MUb(7.5), lty = 2, col = "gray", lwd = segmentlinewidth)
segments(7.5, MUa(7.5), 0, MUa(7.5), lty = 2, col = "gray", lwd = segmentlinewidth)
segments(7.5, 0, 7.5, MUa(7.5), lty = 2, col = "gray", lwd = segmentlinewidth)
points(7.5, MUb(7.5), pch = 16, col = "black", cex = 1.5)

text(7.5 + 0.1, MUb(7.5) + 0.1, expression(paste("h")), cex = labelsize)
points(7.5, MUa(7.5), pch = 16, col = "black", cex = 1.5)

text(4.5, MUb(4.5, beta = 1/4)  + 0.2, expression(paste(j)), cex = labelsize)
points(4.5, MUa(4.5, alpha = 3/4), pch = 16, col = "black", cex = 1.5)


#Label relevant points on axes

#text(20, -.9, expression(paste("x*")), xpd = TRUE, cex = labelsize)
#text(33, -.9, expression(paste("a"[x])), xpd = TRUE, cex = labelsize)

#text(-2, 33, expression(paste(-u[x]^B*(x*minute))),  xpd = TRUE, cex = labelsize)
#text(-2, 7, expression(paste(u[x]^A*(x*minute))),  xpd = TRUE, cex = labelsize)

text(3.8, 6.3, expression(paste("B's marginal disutility")), xpd = TRUE, cex = labelsize)
text(3.8, 6, expression(paste(u[x]^B == 2*beta*(T^B - x))), xpd = TRUE, cex = labelsize)
text(3.8, 5.5, expression(paste(beta == frac(1,2))), xpd = TRUE, cex = labelsize)
text(3.8, 2.2, expression(paste(beta == frac(1,4))), xpd = TRUE, cex = labelsize)


text(8, 6.3, expression(paste("-A's marginal disutility ")),  xpd = TRUE, cex = labelsize)
text(8, 6, expression(paste(-u[x]^A == -2*alpha*(T^A - x))),  xpd = TRUE, cex = labelsize)
text(8, 5.5, expression(paste(alpha == frac(1,2))), xpd = TRUE, cex = labelsize)
text(6.9, 5.5, expression(paste(alpha == frac(3,4))), xpd = TRUE, cex = labelsize)

#Axis arrow
arrows(6.5, -1, 8, -1, xpd = TRUE, length=0.1,angle=40,lwd=3)


dev.off()