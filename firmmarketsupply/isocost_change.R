require(shape)
pdf(file = "bfh-textbook/firmmarketsupply/isocost_change.pdf", width = 9, height = 7)

#Set parameters for graphics
axislabelsize <- 1.5
labelsize <- 1.2
graphlinewidth <- 3
segmentlinewidth <- 2

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#4eb3d3", "#2b8cbe", "#0868ac","#084081")

#Edited the margins to cater for the larger LHS labels
par(mar =  c(6, 6, 4, 4))

isocost <- function(l, c = 10, w = 1, r = 1) {
  c - (w/r)*l
}


isoquant <- function(l, alpha = 0.5, x = 5) {
  (x / l^alpha)^(1/(1 - alpha))
}


xlims <- c(0, 15)
ylims <- c(0, 15)

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
ticksy <- c(0, isoquant(l = 3.5), isoquant(l = 7.5), ylims[2])
ylabels <- c(NA, expression(paste(k[a])), expression(paste(k[b])), NA)
ticksx <- c(0, 3.5, 7.3, xlims[2])
xlabels <- c(NA, expression(paste(l[a])),  expression(paste(l[b])), NA)




axis(1, at = ticksx, pos = 0, labels = xlabels, cex.axis = labelsize)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis = labelsize)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)

#lines(xx1, bcA(xx1, w = 10, p = 1.5), col = COLB[3], lwd = graphlinewidth)
lines(xx1, isocost(xx1, c = 7, w = 0.5, r = 1), col = COLB[3], lwd = graphlinewidth)
lines(xx1, isocost(xx1, c = 14, w = 2, r = 1), col = COLB[3], lwd = graphlinewidth)

#lines(xx1, isocost(xx1, c = 8, w = 1, r = 1), col = COLB[3], lwd = graphlinewidth)
#lines(xx1, isocost(xx1, c = 12, w = 1, r = 1), col = COLB[3], lwd = graphlinewidth)
lines(xx1, isoquant(xx1, x = 5, alpha = 0.5), col = COLA[3], lwd = graphlinewidth)


#Label the axes
mtext(expression(paste("Hours of labor, ", l)), side=1, line = 2.5, cex = axislabelsize)
text(-1.2, 0.5*ylims[2], expression(paste("Amount of capital, ", k)), xpd = TRUE, cex = axislabelsize, srt = 90) 

#Label the indifference curves
# text(13, 3, expression("isoquant"), cex = labelsize)
# text(13, 2.5, expression(paste(x == bar(x))), cex = labelsize)

#Label the price lines
text(6.2, 1, expression(paste(c[hw])), cex = labelsize)
#text(8, 1.3, expression(paste(p[x] == 1)))
text(11.5, 1, expression(paste(c[lw])), cex = labelsize)

#Label a
segments(3.5, 0, 3.5, isoquant(l = 3.5), lty = 2, col = "gray" , lwd = segmentlinewidth)
segments(0, isoquant(l = 3.5) , 3.5, isoquant(l = 3.5), lty = 2, col = "gray" , lwd = segmentlinewidth)
points(3.5, isoquant(l = 3.5), pch = 16, col = "black", cex = 1.5)
text(3.5 + 0.25, isoquant(l = 3.5) + 0.25, expression(paste(a)), cex = labelsize)

#Label b
segments(7.3, 0, 7.3, isoquant(7.3), lty = 2, col = "gray" , lwd = segmentlinewidth)
segments(0, isoquant(l = 7.3) , 7.3, isoquant(l = 7.3), lty = 2, col = "gray" , lwd = segmentlinewidth)
points(7.3, isoquant(l = 7.3), pch = 16, col = "black", cex = 1.5)
text(7.3 + 0.25, isoquant(l = 7.3) + 0.25, expression(paste(b)), cex = labelsize)

#Label i
# segments(0, 5, 5, 5, lty = 2, col = "gray" , lwd = segmentlinewidth)
# segments(5, 0, 5, 5, lty = 2, col = "gray" , lwd = segmentlinewidth)
# points(5, 5, pch = 16, col = "black", cex = 1.5)
# text(5.25, 5.25, expression(paste(i)), cex = labelsize)

#Add label for high wage point
text(3.5, 14, expression(paste("With high wages")), cex = labelsize)
text(3.5, 13.4, expression(paste("the firm hires")), cex = labelsize)
text(3.5, 12.8, expression(paste("less labor and")), cex = labelsize)
text(3.5, 12.2, expression(paste("more capital")), cex = labelsize)
Arrows(3.5, 11.8, 3.5, 7.75, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

#Add label for low wage point
# text(7.3, 7, expression(paste("With low wages")), cex = labelsize)
# text(7.3, 6.4, expression(paste("the firm hires")), cex = labelsize)
# text(7.3, 5.8, expression(paste("more labor and")), cex = labelsize)
# text(7.3, 5.2, expression(paste("less capital")), cex = labelsize)
# Arrows(7.3, 4.8, 7.3, 4, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

text(13, 4.2, expression(paste("With low wages")), cex = labelsize)
text(13, 3.6, expression(paste("the firm hires")), cex = labelsize)
text(13, 3, expression(paste("more labor and")), cex = labelsize)
text(13, 2.4, expression(paste("less capital")), cex = labelsize)
Arrows(11.5, 3.5, 8, 3.5, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

text(14.8, 1.3, expression(paste(bar(x))), cex = labelsize)
#text(14.1, 1.3, expression("isoquant"), cex = labelsize)
#text(13, 2.65, expression(paste(x == bar(x))), cex = labelsize)


# text(5, 10.25, expression(paste(trs(l,k) == mrt(l,k))), cex = labelsize)
# text(5, 9.25, expression(paste(frac(mp[l], mp[k]) == frac(w,r))), cex = labelsize)
# Arrows(5, 8.5, 5, 5.5, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)


#text(9, 5.9, expression(paste(b)), cex = labelsize)
#text(10.5, 7.775, expression(paste(c)), cex = labelsize)

dev.off()
