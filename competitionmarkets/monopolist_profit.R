#Graph Designer: Simon Halliday
#Authors: Bowles, Foley and Halliday
#Title: Coordination, Conflict and Competition: A Text in Microeconomics

require(shape)
pdf(file = "competitionmarkets/monopolist_profit.pdf", width = 9, height = 7)

#Set parameters for graphics
axislabelsize <- 1.5
labelsize <- 1.2
graphlinewidth <- 3
segmentlinewidth <- 2

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#c6dbef", "#4eb3d3", "#2b8cbe", "#0868ac","#084081")

#Edited the margins to cater for the larger LHS labels
par(mar =  c(6, 7, 4, 4))

AvgRevenue <- function(x, rmax = 12, xmax = 12){
  rmax - (rmax/xmax)*x
}
  
MRevenue <- function(x, rmax = 12, xmax = 12){
  rmax - 2*(rmax/xmax)*x
}

AvgCost <- function(x, c0 = 2, c1 = 4){
  c0/x + c1
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

# ticksy <- seq(from = ylims[1], to = ylims[2], by = 1)
# ylabels <- seq(from = ylims[1], to = ylims[2], by = 1)
# ticksx <- seq(from = xlims[1], to = xlims[2], by = 1)
# xlabels <- seq(from = xlims[1], to = xlims[2], by = 1)
ticksy <- c(0, 4, AvgRevenue(x = 4), ylims[2])
ylabels <- c(NA, expression(paste(c[1])), expression(paste(p^{mon})), NA)
ticksx <- c(0, 4, xlims[2])
xlabels <- c(NA, expression(paste(x^{mon})), NA)

axis(1, at = ticksx, pos = 0, labels = xlabels, cex.axis = labelsize)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis = labelsize)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)
xx3 <- seq(2, 6, length.out = npts)

#Draw the polygon for profit
xpoly1 <- c(0, 4, 4, 0, 0)
ypoly1 <- c(4, 4, AvgRevenue(x = 4), AvgRevenue(x = 4), 4)
polygon(x = xpoly1, y = ypoly1, col=COLA[1], density=NULL, border = NA)

#Draw the polygon for costs
xpoly2 <- c(0, 4, 4, 0, 0)
ypoly2 <- c(0, 0, 4, 4, 4)
polygon(x = xpoly2, y = ypoly2, col=COLB[1], density=NULL, border = NA)

#lines(xx1, bcA(xx1, w = 10, p = 1.5), col = COLB[3], lwd = graphlinewidth)
lines(xx1, AvgRevenue(xx1, rmax = 12, xmax = 12), col = COLB[5], lwd = graphlinewidth)
lines(xx1, MRevenue(xx1, rmax = 12, xmax = 12), col = COLB[4], lwd = graphlinewidth)
#lines(xx1, AvgCost(xx1, c0 = 2, c1 = 4), col = COLA[5], lwd = graphlinewidth)

#Label the axes
mtext(expression(paste("Quantity of output, ", x)), side=1, line = 2.5, cex = axislabelsize)
text(-2.1, 0.5*ylims[2], expression(paste("Price, Revenue and Costs, ", list(p, r, ac), " and ", mc)), xpd = TRUE, cex = axislabelsize, srt = 90) 

#Label curves
text(10.5, 4.5, expression(paste(ac(x) == mc(x))), cex = labelsize)
text(10.5, 3, expression(paste(p(x) == p[max] - s*x)), cex = labelsize)
text(6, 3, expression(paste(mr(x) == p[max] - 2*s*x)), cex = labelsize)

#Labels cost and profit areas
text(2, 0.5*AvgCost(x = 4), expression("Total Costs"), cex = labelsize)
text(2, 6, expression("Profit"), cex = labelsize)

#Draw segments for total costs
segments(0, AvgRevenue(x = 4), 4, AvgRevenue(x = 4), lty = 2, col = "gray" , lwd = segmentlinewidth)
segments(4, 0, 4, AvgRevenue(x = 4), lty = 2, col = "gray" , lwd = segmentlinewidth)
segments(0, 4, xlims[2], 4, lty = 1, col = COL[1] , lwd = graphlinewidth)

#Label Points for comparison
points(4, MRevenue(x = 4), pch = 16, col = "black", cex = 1.5)
text(3.8, MRevenue(x = 4) - 0.4, expression(i), cex = labelsize)


points(4, AvgRevenue(x = 4), pch = 16, col = "black", cex = 1.5)
text(4.2, AvgRevenue(x = 4) + 0.4, expression(h), cex = labelsize)


#Arrow to mr = mc
text(7.5, 9.5, expression(paste("Profit Maximum at")), cex = labelsize)
text(7.5, 9, expression(paste(mr == mc)), cex = labelsize)
Arrows(6.1, 9.2, 4.2, 4.3, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)



dev.off()
