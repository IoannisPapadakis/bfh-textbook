require(shape)
pdf(file = "bfh-textbook/indmarketdemand/budget_basic.pdf", width = 9, height = 7)

#Set parameters for graphics
axislabelsize <- 1.5
graphlinewidth <- 3
segmentlinewidth <- 2


COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#c6dbef", "#4eb3d3", "#2b8cbe", "#0868ac","#084081")

#Edited the margins to cater for the larger LHS labels
par(mar =  c(6, 5, 4, 4))

mrsA <- function(x, rmax = 10, xmax = 20) {
  rmax - (rmax/xmax)*x
}


uA <- function(x, y, rmax = 2, xmax = 12) {
  y + rmax*x - (1/2)*(rmax/xmax)*x^2
}

indiffA1 <- function(x, uA = 10, rmax = 2.5, xmax = 10) {
  uA - rmax*x + (1/2)*(rmax/xmax)*(x^2)
}


bcA <- function(x, w = 20, p = 2) {
  w - p*x
}


xlims <- c(0, 13)
ylims <- c(0, 13)

npts <- 501 
x <- seq(xlims[1], xlims[2], length.out = npts)
y <- seq(ylims[1], ylims[2], length.out = npts) 
a <- c(13, 15, 17)

plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")), 
     xaxt = "n", 
     yaxt = "n", 
     cex.lab = axislabelsize, 
     bty = "n",
     xaxs="i", 
     yaxs="i")

# ticksy <- seq(from = 0, to = ylims[2], by = 2)
# ylabels <- seq(from = 0, to = ylims[2], by = 2)
# ticksx <- seq(from = 0, to = xlims[2], by = 2)
# xlabels <- seq(from = 0, to = xlims[2], by = 2)
ticksy <- c(0, 12, ylims[2])
ylabels <- c(NA, expression(paste(y == w/p[y])), NA)
ticksx <- c(0, 12, xlims[2])
xlabels <- c(NA,  expression(paste(x == w/p[x])), NA)

axis(1, at = ticksx, pos = 0, labels = xlabels)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)

xpoly1 <- c(0, 0, 12, 0)
ypoly1 <- c(0, 12, 0, 0)
polygon(x = xpoly1, y = ypoly1, col = COLA[1], density=NULL, border = NA)
xpoly2 <- c(0, 0, 13, 13, 12, 0)
ypoly2 <- c(12, 13, 13, 0, 0, 12)
polygon(x = xpoly2, y = ypoly2, col = COLB[1], density=NULL, border = NA)

lines(xx1, bcA(xx1, w = 12, p = 1), col = COLA[3], lwd = graphlinewidth)

mtext(expression(paste("Quantity of apples, ", x)), side=1, line = 2.5, cex = axislabelsize)
text(-1.4, 6.5, expression(paste("Quanity of oranges, ", y)), xpd = TRUE, cex = axislabelsize, srt = 90) 

text(4, 4, expression("Feasible"))
text(4, 3.5, expression("(within the budget)"))
text(10, 10, expression("Infeasible"))
text(10, 9.5, expression("(outside the budget)"))
#text(7.3, 2.5, expression("Curve"))
#Arrows(7.3, 3.5, 7.3, 6.1, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

#Label the iso-welfare functions for the HG, Aisha
#text(4, 1.5, expression(bc[px]))
#text(7.5, 1.5, expression(bc[px]))
text(11.5, 3, expression("Budget Constraint"))
text(11.5, 2, expression(paste(y == frac(w,p[y]) - bgroup("(",frac(p[x], p[y]),")")*x)))

dev.off()
