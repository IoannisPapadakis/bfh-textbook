require(shape)
library(extrafont)
library(pBrackets)
pdf(file = "what_can_markets_do/edgeworthbox_qql_buyer_seller.pdf", width = 9, height = 7)

#Set parameters for graphics
axislabelsize <- 1.5
labelsize <- 1.2
graphlinewidth <- 3
segmentlinewidth <- 2

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#4eb3d3", "#2b8cbe", "#0868ac","#084081")

par(mar =  c(6, 4, 4, 5))

uA <- function(x, y, rmax = 2, xmax = 12) {
  y + rmax*x - (1/2)*(rmax/xmax)*x^2
}

indiffA <- function(x, utility = 11.9, rmax = 2, xmax = 12) {
  utility - rmax*x + (1/2)*(rmax/xmax)*x^2
}

uB <- function(x, y, rmax = 2, xmax = 12) {
  (10 - y) + rmax*(10 - x) - (1/2)*(rmax/xmax)*(10 - x)^2
}

indiffB <- function(x, utility = 11, rmax = 2, xmax = 12) {
  utility - rmax*(10 - x) + (1/2)*(rmax/xmax)*(10 - x)^2
}


WalrasP <- function(x, slope = 1, intercept = 10) {
  intercept - slope*x
}




xlims <- c(0, 10)
ylims <- c(0, 10)

npts <- 501 
x <- seq(xlims[1], xlims[2], length.out = npts)
y <- seq(ylims[1], ylims[2], length.out = npts) 
a <- c(uA(y = 0, x = 10), 15.8)
b <- c(uB(y = 0, x = 10), 14.2)

#Use the same x and ylims as previously, but with locations switched
xlims2 <- c(10, 0)
ylims2 <- c(10, 0)

#Leave the ylab and xlab blank to ensure no axes titles
plot(0, 0, xlim = xlims2, ylim = ylims2, type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")),
     xaxt = "n", 
     yaxt = "n", 
     cex.lab = 1.3, 
     bty = "n",
     xaxs="i", 
     yaxs="i")

#Set up axes at sides 3 and 4 (top and right)
axis(side = 3, at = ticksx, pos = 0, labels = NA)
axis(side = 4, at = ticksy, pos = 0, labels = NA, las = 0)
text(5, -1, expression(paste("B's Good, x")), xpd = TRUE, cex = axislabelsize) 
#mtext("B's Good, x", side = 3, line = 2.5, cex = axislabelsize)
text(-0.8, 0.15*ylims[2], expression(paste("B's Money, y")), xpd = TRUE, cex = axislabelsize, srt = 270) 

xpoly1 <- seq(from = 0, to = 9.2, length.out = 500)
ypoly1 <- indiffA(xpoly1, utility = uB(y = 0, x = 10))
ypoly2 <- WalrasP(xpoly1, intercept = 10, slope = 1)
polygon(x = c(xpoly1, rev(xpoly1)), y = c(ypoly1, rev(ypoly2)), col = COL[4], density = NULL, border = NA)


#Add arrows:
arrows(-0.8, 3, -0.8, 5, xpd = TRUE, length = 0.1, angle = 40, lwd = 3)
arrows(6, -1, 9, -1, xpd = TRUE, length = 0.1, angle = 40, lwd = 3)

par(new = TRUE)

#B's value when at A's bliss point
#0.35*log(5.88) + 0.35*log(8.88) + 0.5*log(10 - 5.88) + 0.5*log(15 - 8.88) 

#B's bliss point x = 4.11765; y = 6.17647
#A's value when at A's bliss point
#0.5*log(4.11765) + 0.5*log(6.17647) + 0.35*log(10 - 4.11765) + 0.35*log(15 - 6.17647) 


plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")), 
     xaxt = "n", 
     yaxt = "n", 
     cex.lab = axislabelsize, 
     bty = "n",
     xaxs="i", 
     yaxs="i")

ticksy <- seq(from = 0, to = 10, by = 1)
ylabels <- seq(from = 0, to = 10, by = 1)
ticksx <- seq(from = 0, to = 10, by = 1)
xlabels <- seq(from = 0, to = 10, by = 1)
axis(1, at = ticksx, pos = 0, labels = NA)
axis(2, at = ticksy, pos = 0, labels = NA, las = 0)

#Pareto-improving lens
xpoly1 <- seq(from = 0.8, to = xlims[2], length.out = 500)
ypoly1 <- indiffA(xpoly1, utility = uA(y = 0, x = 10))
ypoly2 <- WalrasP(xpoly1, slope = 1, intercept = 10)
polygon(x = c(xpoly1, rev(xpoly1)), y = c(ypoly1, rev(ypoly2)), col = COL[4], density = NULL, border = NA)

# ypoly3 <- indiffB(xpoly1)
# ypoly4 <- WalrasP(xpoly1, intercept = 10)
# polygon(x = c(xpoly1, rev(xpoly1)), y = c(ypoly4, rev(ypoly3)), col = COL[4], density = NULL, border = NA)


contour(x, y, 
        outer(x, y, uA),
        drawlabels = FALSE,
        col = COLA[3],
        lwd = graphlinewidth,
        levels = a, 
        xaxs="i", 
        yaxs="i", 
        add = TRUE) 

text(0.15*ylims[2], -1.2, expression(paste("A's Good, x")), xpd = TRUE, cex = axislabelsize) 
text(-0.6, 0.5*ylims[2], expression(paste("A's Money, y")), xpd = TRUE, cex = axislabelsize, srt = 90) 


#Add arrows:
arrows(-0.6, 6.5, -0.6, 9, xpd = TRUE, length=0.1,angle=40,lwd=3)
arrows(2.5, -1.2, 4.5, -1.2, xpd = TRUE, length=0.1,angle=40,lwd=3)


xx1 <- seq(xlims[1], xlims[2], length.out = npts)
xx2 <- seq(2.5, xlims[2], length.out = npts)
#lines(xx1, WalrasP(xx1, intercept = 11), col = "gray", lwd = segmentlinewidth)
lines(xx2, WalrasP(xx2, intercept = 10), col = "purple", lwd = segmentlinewidth, lty = 1)
#lines(xx1, WalrasP(xx1, intercept = 10.9, slope = 8.2/7), col = "purple", lwd = segmentlinewidth, lty = 1)

contour(x, y, 
        outer(x, y, uB),
        drawlabels = FALSE,
        col = COLB[2],
        lwd = graphlinewidth,
        levels = b, 
        add = TRUE
) 

segments(5, 3.95, 5, 6.05, lty = 1, col = COL[2] , lwd = graphlinewidth)
segments(5, 0, 5, 3.95, col = COL[2] , lwd = segmentlinewidth, lty = 2)
segments(5, 6.05, 5, 10, col = COL[2] , lwd = segmentlinewidth, lty = 2)

#Label the PEC
text(8, 8.8, expression("Pareto Efficient Curve"))
Arrows(6.8, 8.8, 5.2, 8.8, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

#Label the walrasian P
text(4, 9.6, expression(paste("Price line")))
text(4, 9.2, expression(slope == -p[n] ))
Arrows(4, 9, 4, 5.8, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)


#Label the iso-welfare functions for the HG, Aisha
text(9.65, 0.6, expression(v[1]^A))
text(9.65, 2.8, expression(v[2]^A))

#Label the indifference curves for the HG, Betty
text(1, 9, expression(v[1]^B))
text(1, 6.8, expression(v[2]^B))
#text(2.6, 8.1, expression(v[3]^B))
#text(3.4, 6.9, expression(v[4]^B))

#Point for seeing where the indifference curves intersect on the LHS
#points(1.5, 9.1, pch = 16, col = "black", cex = 1.5)


#Label point i. 
points(5, 3.95, pch = 16, col = "black", cex = 1.5)
text(4.8, 3.8, expression(paste(f)))

segments(5, 4.4, 10, 4.4, col = COL[2] , lwd = segmentlinewidth, lty = 2)
points(5, 5, pch = 16, col = "black", cex = 1.5)
text(5.2, 4.6, expression(paste(n)))


points(5, 6.05, pch = 16, col = "black", cex = 1.5)
text(4.8, 5.9, expression(paste(g)))

#Initial Allocations
segments(8.48, 0, 8.48, 0.88, col = COL[2] , lwd = segmentlinewidth, lty = 2)
segments(10, 0.88, 8.48, 0.88, col = COL[2] , lwd = segmentlinewidth, lty = 2)

points(x = 8.48, y = 0.92, pch = 16, col = "black", cex = 1.5)
text(8.3, 0.8, expression(paste(e)))




#Braces for labels
brackets(x1 = 8.5, y1 = -0.3, x2 = 5, y2 = -0.3,  
         ticks = 0.5, curvature = 0.5, type = 1, 
         col = "black", lwd = 2, lty = 1, xpd = TRUE)
text(6.6, -1, expression(paste("Quantity of the good, x")), xpd = TRUE)
text(6.6, -1.4, expression(paste("A sells to B")), xpd = TRUE)

brackets(x1 = 10.2, y1 = 4.4, x2 = 10.2, y2 = 0.9,  
         ticks = 0.5, curvature = 0.5, type = 1, 
         col = "black", lwd = 2, lty = 1, xpd = TRUE)
text(11.2, 2.6, expression(paste("Quantity of money, y")), xpd = TRUE, srt = 270)
text(10.9, 2.6, expression(paste("B pays A")), xpd = TRUE, srt = 270)


dev.off()

