require(shape)
pdf(file = "bfh-textbook/indmarketdemand/production_drs.pdf", width = 9, height = 7)

#Set parameters for graphics
axislabelsize <- 1.5
graphlinewidth <- 3
segmentlinewidth <- 2

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#4eb3d3", "#2b8cbe", "#0868ac","#084081")

#Edited the margins to cater for the larger LHS labels
par(mar =  c(6, 5, 4, 4))

#Change this to make it log of l 

prodFn <- function(l, k = 0.5) {
  k*log(l + 1)
}

MprodFn <- function(l, k = 0.5) {
  k*(1/(l + 1))
}

AprodFn <- function(l, k = 0.5) {
  (k*log(l + 1))/l
}

Mpline <- function(l, constant = 0.3181472, slope = 0.125){
  constant + slope*l
}

xlims <- c(0, 10)
ylims <- c(0, 1.3)

npts <- 501 
x <- seq(xlims[1], xlims[2], length.out = npts)
y <- seq(ylims[1], ylims[2], length.out = npts) 
a <- c(13, 15, 17)

plot(1, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")), 
     xaxt = "n", 
     yaxt = "n", 
     cex.lab = axislabelsize, 
     bty = "n",
     xaxs="i", 
     yaxs="i")

# ticksy <- seq(from = 0, to = ylims[2], by = 0.25)
# ylabels <- seq(from = 0, to = ylims[2], by = 0.25)
# ticksx <- seq(from = 0, to = xlims[2], by = 1)
# xlabels <- seq(from = 0, to = xlims[2], by = 1)
ticksy <- c(0, prodFn(l = 2, k = 0.5), prodFn(l = 4, k = 0.5), prodFn(l = 8, k = 0.5), ylims[2])
ylabels <- c(NA, expression(paste(x(l == 2))), expression(paste(x(l == 4))), expression(paste(x(l==8))), NA)
ticksx <- c(0, 2, 4, 8, xlims[2])
xlabels <- c(NA, 2, 4, 8, NA)

axis(1, at = ticksx, pos = 0, labels = xlabels)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)
xx2 <- seq(0, xlims[2], length.out = npts)
xx3 <- seq(1, 3, length.out = npts)
xx4 <- seq(3, 5, length.out = npts)
xx5 <- seq(7, 9, length.out = npts)

lines(xx1, prodFn(xx1, k = 0.5), col = COLB[4], lwd = graphlinewidth)
#lines(xx2, MprodFn(xx1, k = 0.5), col = COLA[1], lwd = graphlinewidth)
#lines(xx1, AprodFn(xx1, k = 0.5), col = COLA[2], lwd = graphlinewidth)
lines(xx3, Mpline(xx3, constant = prodFn(l = 2, k = 0.5) - 2*MprodFn(l = 2, k = 0.5), slope = MprodFn(l = 2, k = 0.5)), col = "gray", lty = 2, lwd = graphlinewidth)
lines(xx4, Mpline(xx4, constant = prodFn(l = 4, k = 0.5) - 4*MprodFn(l = 4, k = 0.5), slope = MprodFn(l = 4, k = 0.5)), col = "gray", lty = 2, lwd = graphlinewidth)
lines(xx5, Mpline(xx5, constant = prodFn(l = 8, k = 0.5) - 8*MprodFn(l = 8, k = 0.5), slope = MprodFn(l = 8, k = 0.5)), col = "gray", lty = 2, lwd = graphlinewidth)
#lines(xx1, indiffA1(xx1, uA = 20, rmax = 2.5, xmax = 10), col = COLB[4], lwd = graphlinewidth)



#Label axes
mtext(expression(paste("Hours of Labor, ", l)), side = 1, line = 2.5, cex = axislabelsize)
text(-1.2, 0.75, expression(paste("Total Product, ", x)), xpd = TRUE, cex = axislabelsize, srt = 90) 

#Points and segments for l = 8
segments(0, prodFn(l = 8, k = 0.5), 8, prodFn(l = 8, k = 0.5), lty = 2, col = "gray" , lwd = segmentlinewidth)
segments(8, 0, 8, prodFn(l = 8, k = 0.5), lty = 2, col = "gray" , lwd = segmentlinewidth)
segments(0, 0, 8, prodFn(l = 8, k = 0.5), lty = 2, col = COLB[4] , lwd = segmentlinewidth)
points(8, prodFn(l = 8, k = 0.5), pch = 16, col = "black", cex = 1.5)

#Points and segments for l = 4
segments(0, prodFn(l = 4, k = 0.5), 4, prodFn(l = 4, k = 0.5), lty = 2, col = "gray" , lwd = segmentlinewidth)
segments(4, 0, 4, prodFn(l = 4, k = 0.5), lty = 2, col = "gray" , lwd = segmentlinewidth)
segments(0, 0, 4, prodFn(l = 4, k = 0.5), lty = 2, col = COLB[4] , lwd = segmentlinewidth)
points(4, prodFn(l = 4, k = 0.5), pch = 16, col = "black", cex = 1.5)

#Points and segments for l = 2
segments(0, prodFn(l = 2, k = 0.5), 2, prodFn(l = 2, k = 0.5), lty = 2, col = "gray" , lwd = segmentlinewidth)
segments(2, 0, 2, prodFn(l = 2, k = 0.5), lty = 2, col = "gray" , lwd = segmentlinewidth)
segments(0, 0, 2, prodFn(l = 2, k = 0.5), lty = 2, col = COLB[4] , lwd = segmentlinewidth)
points(2, prodFn(l = 2, k = 0.5), pch = 16, col = "black", cex = 1.5)

#Label the iso-welfare functions for the HG, Aisha
text(9.2, 1.1, expression(paste("Total Product")))
text(9.2, 1, expression(x == frac(1,2)*ln(1 + l)))


#Average Product
text(6, 0.45, expression(paste("Slope of ray from origin")))
text(6, 0.4, expression(paste("equals Average Product")))
#Arrows(2.7, 0.3, 1.3, 0.3, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)
Arrows(6, 0.48, 6, 0.78, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

#Marginal Product
text(2, prodFn(l = 6, k = 0.5) + 0.02, expression(paste("Slope of tangent line")))
text(2, prodFn(l = 6, k = 0.5) - 0.03, expression(paste("equals Marginal Product")))
Arrows(2, prodFn(l = 6, k = 0.5) - 0.075, 2, prodFn(l = 2, k = 0.5) + 0.05 , col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)
#Arrows(3.2, prodFn(l = 6, k = 0.5), 5.7, prodFn(l = 6, k = 0.5), col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)



#text(6.6, 8.3, expression(u[4]^A))

#Label the indifference curves for the HG, Betty
# text(7.6, 17, expression(u[1]^B))
# text(6.75, 17, expression(u[2]^B))
# text(6, 17, expression(u[3]^B))
#text(3.4, 6.9, expression(v[4]^B))

#Label mrs function
#text(10, 8, expression(paste(mrs(x,y) == r[max] - frac(r[max], x[max])*x)))
#Arrows(10, 7.5, 10, 5.6, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

#Label satiation
#text(20, 4, expression(paste(x[max] == "Point")))
#text(20, 3, expression(paste("of Satiation")))
#Arrows(20, 2.5, 20, 0.5, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

#Label highest willingness to pay
# text(5, 10.5, expression(paste(r[max] == "Maximum")))
# text(5, 9.5, expression(paste("Willingness to Pay")))
# Arrows(3, 10, 0.5, 10, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)


# contour(x, y, 
#         outer(x, y, uA),
#         #labels = c("v1", "v2", "v3"),
#         drawlabels = FALSE,
#         col = COLA[3],
#         #xlab = expression(paste("A's Apples, ", x)),
#         #ylab = expression(paste("A's Oranges, ", y)),
#         #cex.lab = axislabelsize,
#         lwd = graphlinewidth,
#         levels = a, 
#         xaxs="i", 
#         yaxs="i", 
#         add = TRUE)

# segments(0, 6, 6, 6, lty = 2, col = "gray" , lwd = segmentlinewidth)
# segments(6, 0, 6, 6, lty = 2, col = "gray" , lwd = segmentlinewidth)
# points(6, 6, pch = 16, col = "black", cex = 1.5)

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
