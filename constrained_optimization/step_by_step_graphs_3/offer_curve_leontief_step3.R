#Graph Designer: Simon Halliday & Madeleine Wettach '20
#Authors: Bowles, Foley and Halliday
#Title: Microeconomics: Competition, Conflict and Coordination

require(shape)
pdf(file = "constrained_optimization/step_by_step_graphs_3/offer_curve_leontief_step3.pdf", width = 9, height = 7)

#Set parameters for graphics
axislabelsize <- 1.5
graphlinewidth <- 3
segmentlinewidth <- 2

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#4eb3d3", "#2b8cbe", "#0868ac","#084081")

#Edited the margins to cater for the larger LHS labels
par(mar =  c(6, 5, 4, 4))

# uA <- function(x, y, rmax = 2, xmax = 12) {
#   y + rmax*x - (1/2)*(rmax/xmax)*x^2
# }
# 
# indiffA1 <- function(x, uA = 10, rmax = 2.5, xmax = 10) {
#   uA - rmax*x + (1/2)*(rmax/xmax)*(x^2)
# }

offerCurve <- function(x, w, rmax = 2, xmax = 12) {
  x 
}

PriceLine <- function(x, w = 10, p = 1) {
  w - p*x
}


xlims <- c(0, 12)
ylims <- c(0, 12)

npts <- 501 
x <- seq(xlims[1], xlims[2], length.out = npts)
y <- seq(ylims[1], ylims[2], length.out = npts) 
a <- c(13, 16.75, 19.25)

plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")), 
     xaxt = "n", 
     yaxt = "n", 
     cex.lab = axislabelsize, 
     bty = "n",
     xaxs="i", 
     yaxs="i")

ticksy <- seq(from = 0, to = ylims[2], by = 2)
ylabels <- seq(from = 0, to = ylims[2], by = 2)
ticksx <- seq(from = 0, to = xlims[2], by = 2)
xlabels <- seq(from = 0, to = xlims[2], by = 2)
# ticksy <- c(0, 13, 15, 17, ylims[2])
# ylabels <- c(NA, expression(paste(y == u[1])), expression(paste(y == u[2])), expression(paste(y == u[3])), NA)
# ticksx <- c(0,  xlims[2])
# xlabels <- c(NA, NA)

axis(1, at = ticksx, pos = 0, labels = xlabels)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)

#lines(xx1, bcA(xx1, w = 10, p = 1.5), col = COLB[3], lwd = graphlinewidth)
lines(xx1, PriceLine(xx1, w = 10, p = 4), col = COLB[3], lwd = graphlinewidth)
lines(xx1, PriceLine(xx1, w = 10, p = 1), col = COLB[3], lwd = graphlinewidth)
lines(xx1, PriceLine(xx1, w = 10, p = 1.5), col = COLB[3], lwd = graphlinewidth)

#lines(xx1, offerCurve(xx1, w = 10, rmax = 2, xmax = 12), col = COL[3], lwd = graphlinewidth)
#lines(xx1, indiffA1(xx1, uA = 20, rmax = 2.5, xmax = 10), col = COLB[4], lwd = graphlinewidth)



mtext(expression(paste("Quantity of Left Shoes, ", x)), side=1, line = 2.5, cex = axislabelsize)
text(-1.4, 0.5*ylims[2], expression(paste("Quanity of right shoes, ", y)), xpd = TRUE, cex = axislabelsize, srt = 90) 

#segments(4.11765, 6.17647, 5.88, 8.88, lty = 1, col = COL[2] , lwd = graphlinewidth)
#text(7.3, 3, expression("Pareto Efficient"))
#text(7.3, 2.5, expression("Curve"))
#Arrows(7.3, 3.5, 7.3, 6.1, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

#Label the iso-welfare functions for the HG, Aisha
text(11.8, 1.7, expression(u[1]))
text(11.8, 3.7, expression(u[2]))
text(11.8, 4.7, expression(u[3]))

text(9, 10, expression("Offer Curve"))
#text(6.6, 8.3, expression(u[4]^A))

#Label the indifference curves for the HG, Betty
# text(7.6, 17, expression(u[1]^B))
# text(6.75, 17, expression(u[2]^B))
# text(6, 17, expression(u[3]^B))
#text(3.4, 6.9, expression(v[4]^B))

xx2 <- seq(2, xlims[2], length.out = npts)
lines(xx2, offerCurve(xx2, w = 10, rmax = 2, xmax = 12), col = COL[3], lwd = graphlinewidth)

#Graph left and right shoes
#2 for 2
segments(2, 2, 2, ylims[2], lty = 1, col = COLA[3] , lwd = graphlinewidth)
segments(2, 2, xlims[2], 2, lty = 1, col = COLA[3] , lwd = graphlinewidth)
segments(4, 4, 4, ylims[2], lty = 1, col = COLA[3] , lwd = graphlinewidth)
segments(4, 4, xlims[2], 4, lty = 1, col = COLA[3] , lwd = graphlinewidth)

segments(5, 5, 5, ylims[2], lty = 1, col = COLA[3] , lwd = graphlinewidth)
segments(5, 5, xlims[2], 5, lty = 1, col = COLA[3] , lwd = graphlinewidth)
#points(6, 6, pch = 16, col = "black", cex = 1.5)

# par(new = TRUE)
# 
# #Use the same x and ylims as previously, but with locations switched
# xlims2 <- c(18, 0)
# ylims2 <- c(18, 0)

#Leave the ylab and xlab blank to ensure no axes titles
# plot(0, 0, xlim = xlims2, ylim = ylims2, type = "n",
#      xlab = expression(paste("")),
#      ylab = expression(paste("")),
#      xaxt = "n", 
#      yaxt = "n", 
#      cex.lab = 1.3, 
#      bty = "n",
#      xaxs="i", 
#      yaxs="i")
# 
# 
# lines(xx1, indiffAlow(xx1, uA = 46.08, alpha = 16, beta = 1/24), col = COL[2], lwd = graphlinewidth)


#Set up axes at sides 3 and 4 (top and right)
# axis(side = 3, at = ticksx, pos = 0, labels = xlabels)
# axis(side = 4, at = ticksy, pos = 0, labels = ylabels, las = 0)
# mtext("B's Apples, x", side=3, line = 2.5, cex = axislabelsize)
# text(-0.8, 7, expression(paste("B's Oranges, y")), xpd = TRUE, cex = axislabelsize, srt = 270) 
# 
# #Add arrows:
# arrows(-0.8, 10, -0.8, 14, xpd = TRUE, length=0.1,angle=40,lwd=3)
# arrows(6.2, -1.8, 9, -1.8, xpd = TRUE, length=0.1,angle=40,lwd=3)
# 

#Customize ticks and labels for the plot
#ticksy <- seq(from = 0, to = 15, by = 1)
#ylabels <- seq(from = 0, to = 15, by = 1)
#ticksx <- seq(from = 0, to = 10, by = 1)
#xlabels <- seq(from = 0, to = 10, by = 1)
#axis(1, at = ticksx, pos = 0, labels = xlabels)
#axis(2, at = ticksy, pos = 0, labels = ylabels, las = 0)

dev.off()
