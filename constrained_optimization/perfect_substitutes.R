require(shape)
pdf(file = "bfh-textbook/constrained_optimization/perfect_substitutes.pdf", width = 9, height = 7)

#Set parameters for graphics
axislabelsize <- 1.5
labelsize <- 1.3
graphlinewidth <- 3
segmentlinewidth <- 2

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#4eb3d3", "#2b8cbe", "#0868ac","#084081")

#Edited the margins to cater for the larger LHS labels
par(mar =  c(6, 5, 4, 4))

PriceLine <- function(x, w = 10, p = 1) {
  w - p*x
}


xlims <- c(0, 10)
ylims <- c(0, 10)

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

ticksy <- seq(from = 0, to = ylims[2], by = 1)
ylabels <- seq(from = 0, to = ylims[2], by = 1)
ticksx <- seq(from = 0, to = xlims[2], by = 1)
xlabels <- seq(from = 0, to = xlims[2], by = 1)
# ticksy <- c(0, 13, 15, 17, ylims[2])
# ylabels <- c(NA, expression(paste(y == u[1])), expression(paste(y == u[2])), expression(paste(y == u[3])), NA)
# ticksx <- c(0,  xlims[2])
# xlabels <- c(NA, NA)

axis(1, at = ticksx, pos = 0, labels = xlabels)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)

lines(xx1, bcA(xx1, w = 3, p = 3/5), col = COLA[3], lwd = graphlinewidth)
lines(xx1, bcA(xx1, w = 4.5, p = 3/5), col = COLA[3], lwd = graphlinewidth)
lines(xx1, bcA(xx1, w = 6, p = 3/5), col = COLA[3], lwd = graphlinewidth)
# lines(xx1, PriceLine(xx1, w = 10, p = 4), col = COLB[3], lwd = graphlinewidth)
# lines(xx1, PriceLine(xx1, w = 10, p = 1), col = COLB[3], lwd = graphlinewidth)
# lines(xx1, PriceLine(xx1, w = 10, p = 1.5), col = COLB[3], lwd = graphlinewidth)

#lines(xx1, offerCurve(xx1, w = 10, rmax = 2, xmax = 12), col = COL[3], lwd = graphlinewidth)
#lines(xx1, indiffA1(xx1, uA = 20, rmax = 2.5, xmax = 10), col = COLB[4], lwd = graphlinewidth)



mtext(expression(paste("Quantity of Moonshine, ", x)), side=1, line = 2.5, cex = axislabelsize)
text(-0.8, 0.5*ylims[2], expression(paste("Quanity of Whiskey, ", y)), xpd = TRUE, cex = axislabelsize, srt = 90) 

#segments(4.11765, 6.17647, 5.88, 8.88, lty = 1, col = COL[2] , lwd = graphlinewidth)
#text(7.3, 3, expression("Pareto Efficient"))
#text(7.3, 2.5, expression("Curve"))
#Arrows(7.3, 3.5, 7.3, 6.1, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

#Label the iso-welfare functions for the HG, Aisha
text(4.5, .5, expression(u[1]), cex = labelsize)
text(7, .5, expression(u[2]), cex = labelsize)
text(9.5, .5, expression(u[3]), cex = labelsize)

#text(9, 10, expression("Offer Curve"))
#text(6.6, 8.3, expression(u[4]^A))

#Label the indifference curves for the HG, Betty
# text(7.6, 17, expression(u[1]^B))
# text(6.75, 17, expression(u[2]^B))
# text(6, 17, expression(u[3]^B))
#text(3.4, 6.9, expression(v[4]^B))

# xx2 <- seq(2, xlims[2], length.out = npts)
# lines(xx2, offerCurve(xx2, w = 10, rmax = 2, xmax = 12), col = COL[3], lwd = graphlinewidth)

#Graph left and right shoes
#2 for 2
# segments(2, 2, 2, ylims[2], lty = 1, col = COLA[3] , lwd = graphlinewidth)
# segments(2, 2, xlims[2], 2, lty = 1, col = COLA[3] , lwd = graphlinewidth)
# segments(4, 4, 4, ylims[2], lty = 1, col = COLA[3] , lwd = graphlinewidth)
# segments(4, 4, xlims[2], 4, lty = 1, col = COLA[3] , lwd = graphlinewidth)
# 
# segments(6, 6, 6, ylims[2], lty = 1, col = COLA[3] , lwd = graphlinewidth)
# segments(6, 6, xlims[2], 6, lty = 1, col = COLA[3] , lwd = graphlinewidth)
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

dev.off()
