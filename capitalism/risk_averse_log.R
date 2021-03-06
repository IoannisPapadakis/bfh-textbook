#Graph Designer(s): Simon Halliday & Riley Boeth '17
#Authors: Bowles, Foley and Halliday
#Title: Coordination, Conflict and Competition: A Text in Microeconomics

library(shape)
pdf(file = "capitalism/risk_averse.pdf", width = 10, height = 8)

#Set parameters for graphics
axislabelsize <- 1.5
labelsize <- 2
graphlinewidth <- 3
segmentlinewidth <- 2

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#4eb3d3", "#2b8cbe", "#0868ac","#084081")

#Edited the margins to cater for the larger LHS labels
par(mar =  c(6, 6, 4, 4))

#Concave utility of wealth function

ConcaveU <- function(x){
  log(1+x)
}

#Add limits on axes and levels of utility for each indifference curve
ylims <- c(0, 5)
xlims <- c(0, 100)

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

#x and y limits with plain axes without ticks/numbers to match previous graph

ticksy <- c(0, ylims[2])
ylabels <- c(NA, NA)
ticksx <- c(0, xlims[2])
xlabels <- c(NA, NA)

axis(1,at = ticksx,  pos = 0, labels = xlabels)
axis(2,at = ticksy,  pos = 0, labels = FALSE, las = 1)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)
xx2 <- seq(0, xlims[2], length.out = npts)
xx3 <- seq(xlims[1], 0, length.out = npts)
xx4 <- seq(-11, 0, length.out = npts)

#Axis labels and draw linear utility function
mtext(expression(paste("Income, y")), side = 1, line = 2.5, cex = axislabelsize)
text(-5, 0.5*ylims[2], expression(paste("Utility of income, u(y)")), xpd = TRUE, cex = axislabelsize, srt = 90) 

lines(xx1, ConcaveU(xx1), col = COLB[4], lwd = graphlinewidth)

#Add line from pt a to pt c
#segments(2, ConcaveU(2), 36, ConcaveU(36), lty = 1, col = COLB[4] , lwd = graphlinewidth)


#Label 5 points on line
# text(2.7, ConcaveU(2)-.5, expression(paste("a")), cex = labelsize)
# segments(2, 0, 2, ConcaveU(2), lty = 2, col = "gray", lwd = segmentlinewidth)
# segments(0, ConcaveU(2), 2, ConcaveU(2), lty = 2, col = "gray", lwd = segmentlinewidth)
# points(2, ConcaveU(2), pch = 16, col = "black", cex = 1.5)

# 
# text(24.18, ConcaveU(23.18)-.5, expression(paste("c")), cex = labelsize)
# segments(23.18, 0, 23.18, ConcaveU(23.18), lty = 2, col = "gray", lwd = segmentlinewidth)
# segments(0, ConcaveU(23.18), 23.18, ConcaveU(23.18), lty = 2, col = "gray", lwd = segmentlinewidth)
# points(23.18, ConcaveU(23.18), pch = 16, col = "black", cex = 1.5)

# text(24.18, ConcaveU(13)-.5, expression(paste("e")), cex = labelsize)
# segments(0, ConcaveU(13), 23.18, ConcaveU(13), lty = 2, col = "gray", lwd = segmentlinewidth)
# points(23.18, ConcaveU(13), pch = 16, col = "black", cex = 1.5)

# text(13.8, ConcaveU(13)-.7, expression(paste("b")), cex = labelsize)
# segments(13, 0, 13, ConcaveU(13), lty = 2, col = "gray", lwd = segmentlinewidth)
# points(13, ConcaveU(13), pch = 16, col = "black", cex = 1.5)
# 
# text(36.8, ConcaveU(36)-.9, expression(paste("d")), cex = labelsize)
# segments(36, 0, 36, ConcaveU(36), lty = 2, col = "gray", lwd = segmentlinewidth)
# segments(0, ConcaveU(36), 36, ConcaveU(36), lty = 2, col = "gray", lwd = segmentlinewidth)
# points(36, ConcaveU(36), pch = 16, col = "black", cex = 1.5)

#Label y-sub,x-sub,etc. on axes

#SH: removed these because I could add them to x-axis; y-axis labels cannot be added as usual
#text(36, -.9, expression(paste(y + Delta*y[1])), xpd = TRUE, cex = labelsize)
#text(13, -.9, expression(paste(y[ce])),  xpd = TRUE,  cex = labelsize)
#text(2, -.9, expression(paste(y - Delta*y[2])),  xpd = TRUE,  cex = labelsize)
#text(23.18, -.9, expression(paste(y)),  xpd = TRUE,  cex = labelsize)


# text(-2.7, ConcaveU(36), expression(paste("v(y + ",Delta,"y)")), xpd = TRUE, cex = labelsize)
# text(-1.95, ConcaveU(13)+1.7, expression(paste("v(ce) = ")),  xpd = TRUE, cex = labelsize)
# text(-3, ConcaveU(13), expression(paste(P*v(y- Delta*y[2]) + phantom())),  xpd = TRUE, cex = labelsize)
# text(-4.2, ConcaveU(13)-1.5, expression(paste((1 - P)*v*(y + Delta*y[1]))),  xpd = TRUE, cex = labelsize)
# text(-1.8, ConcaveU(13)-3, expression(paste(" = v(y)")),  xpd = TRUE, cex = labelsize)
# text(-2.7, ConcaveU(2), expression(paste(v(y - Delta*y[2]))),  xpd = TRUE,  cex = labelsize)
# text(-1.5, ConcaveU(23.18), expression(paste("u(y)")),  xpd = TRUE,  cex = labelsize)

#Very risk averse
text(12, ConcaveU(10)-1, expression(paste("very risk")),  xpd = TRUE,  cex = labelsize)
text(12, ConcaveU(10)-1.3, expression(paste("averse")),  xpd = TRUE,  cex = labelsize)
#Risk averse
text(45, ConcaveU(45)-0.2, expression(paste("risk")),  xpd = TRUE,  cex = labelsize)
text(45, ConcaveU(45)-0.5, expression(paste("averse")),  xpd = TRUE,  cex = labelsize)
#Risk neutral
text(90, ConcaveU(80)-0.15, expression(paste("risk")),  xpd = TRUE,  cex = labelsize)
text(90, ConcaveU(80)-.45, expression(paste("neutral")),  xpd = TRUE,  cex = labelsize)


dev.off()