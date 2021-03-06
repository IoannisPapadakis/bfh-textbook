#Graph Designer: Simon Halliday
#Authors: Bowles, Foley and Halliday
#Title: Coordination, Conflict and Competition: A Text in Microeconomics

library(shape)
pdf(file = "credit/non_contractual_brf.pdf", width = 8, height = 6)

#Set parameters for graphics
axislabelsize <- 1.5
labelsize <- 1.1
graphlinewidth <- 3
segmentlinewidth <- 2

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#c6dbef", "#4eb3d3", "#2b8cbe", "#0868ac","#084081")

#Edited the margins to cater for the larger LHS labels
par(mar =  c(4, 6, 4, 4))

brfFn <- function(delta, mu = 1) {
  .5 + (delta / (2 * mu)) 
}

isoreturnFn <- function(delta, pi=0.125) {
  1 - (pi)/delta
}


yFn <- function(d1, f1, mu = 1){
  mu*f1*(1 - f1) - d1*(1 - f1)
}

ylow <- function(delta, mu = 1, ybar = 0.03){
  (-sqrt(delta^2 - 2*delta*mu + mu^2 - 4*mu*ybar) + delta + mu)/(2*mu)
}

yhigh <- function(delta, mu = 1, ybar = 0.03){
  (sqrt(delta^2 - 2*delta*mu + mu^2 - 4*mu*ybar) + delta + mu)/(2*mu)
}

xlims <- c(0, 1)
ylims <- c(0, 1.05)

npts <- 501 
d1 <- seq(xlims[1], xlims[2], length.out = npts)
f1 <- seq(ylims[1], ylims[2], length.out = npts) 
a <- c(0.03, 0.0625, 0.11)

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


# ticksy <- seq(from = 0, to = ylims[2], by = 0.1)
# ylabels <- seq(from = 0, to = ylims[2], by = 0.1)
# ticksx <- seq(from = 0, to = xlims[2], by = 0.1)
# xlabels <- seq(from = 0, to = xlims[2], by = 0.1)
ticksy <- c(ylims[1], 0.5, ylow(delta = 0.5), brfFn(delta = 0.34), brfFn(delta = 0.5), brfFn(delta = 0.65), yhigh(delta = 0.5), ylims[2])
ylabels <- c(NA, expression(paste(f == frac(1,2))), expression(paste(f^d)), expression(paste(f*(delta^L) )),  expression(paste(f*(delta^n) == frac(3,4))),expression(paste(f*(delta^H) )), expression(paste(f^e)), NA)
ticksx <- c(xlims[1], 0.34, 0.5, 0.65, xlims[2])
xlabels <- c(NA,  expression(paste(delta^L)), expression(paste(delta^n)), expression(paste(delta^H)), NA)

axis(1, at = ticksx, pos = 0, labels = xlabels)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1)

npts <- 503 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)
xx2 <- seq(0, 1, length.out = npts)

#Draw the graphs
lines(xx1, brfFn(xx1), col = COLA[4], lwd = graphlinewidth)

#Axis labels
mtext(expression(paste("Interest factor, ", delta)), side = 1, line = 2.5, cex = axislabelsize)
text(-0.16, 0.5*(ylims[2]), expression(paste("Probability of failure (risk), ", f)), xpd = TRUE, cex = axislabelsize, srt = 90) 

#Contour lines
contour(d1, f1,
        outer(d1, f1, yFn),
        drawlabels = FALSE,
        col = COLA[3],
        lwd = graphlinewidth,
        levels = a,
        xaxs="i",
        yaxs="i",
        add = TRUE)

segments(0.5, 0, 0.5, yhigh(delta = 0.5), lty = 2, col = "gray" , lwd = segmentlinewidth)
segments(0, yhigh(delta = 0.5), 0.5, yhigh(delta = 0.5), lty = 2, col = "gray" , lwd = segmentlinewidth)
segments(0, ylow(delta = 0.5), 0.5, ylow(delta = 0.5), lty = 2, col = "gray" , lwd = segmentlinewidth)

segments(0.34, brfFn(delta = 0.34) - 0.15, 0.34, brfFn(delta = 0.34) + 0.15, lty = 2, col = "gray" , lwd = segmentlinewidth)
segments(0.655, brfFn(delta = 0.655) - 0.15, 0.655, brfFn(delta = 0.655) + 0.15, lty = 2, col = "gray" , lwd = segmentlinewidth)

#segments(0, brfFn(delta = 0.5), 0.5, brfFn(delta = 0.5), lty = 2, col = "gray" , lwd = segmentlinewidth)

# 
# segments(8, 0, 8,indiffA(x = 8)  , lty = 2, col = "gray" , lwd = segmentlinewidth)
# segments(0, indiffA(x = 8) , 8,indiffA(x = 8)  , lty = 2, col = "gray" , lwd = segmentlinewidth)

text(0.5+ 0.02, brfFn(delta = 0.5) - 0.02, expression(paste(n)), cex = labelsize)
points(0.5, brfFn(delta = 0.5), pch = 16, col = "black", cex = 1.5)
text(0.34+ 0.02, brfFn(delta = 0.34) - 0.02, expression(paste(b)), cex = labelsize)
points(0.34, brfFn(delta = 0.34), pch = 16, col = "black", cex = 1.5)
text(0.65+ 0.02, brfFn(delta = 0.65) - 0.02, expression(paste(c)), cex = labelsize)
points(0.65, brfFn(delta = 0.65), pch = 16, col = "black", cex = 1.5)

text(0.5+ 0.02, ylow(delta = 0.5) - 0.02, expression(paste(d)), cex = labelsize)
points(0.5, ylow(delta = 0.5), pch = 16, col = "black", cex = 1.5)
text(0.5+ 0.02, yhigh(delta = 0.5) - 0.02, expression(paste(e)), cex = labelsize)
points(0.5, yhigh(delta = 0.5), pch = 16, col = "black", cex = 1.5)



text(0.5, 1.01, expression(paste("Iso-expected income curves")), cex = labelsize)
text(0.2, 1.01, expression(paste(y[1] == y^L)), cex = labelsize)
text(0.2, 0.87, expression(paste(y[2] == y^{NE})), cex = labelsize)
text(0.2, 0.77, expression(paste(y[3] == y^H)), cex = labelsize)
text(0.3, 0.2, expression(Slope), cex = labelsize)
text(0.3, 0.14, expression(paste(-mrs(delta, f) == frac(1 - f, mu*(1 - 2*f) + delta))), cex = labelsize)
Arrows(0.3, 0.22, 0.3, 0.28, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

text(0.85, 0.7, expression(paste("A's Best Response")), cex = labelsize)
text(0.85, 0.65, expression(paste("function")), cex = labelsize)
text(0.85, 0.58, expression(paste("Slope ", phantom() == frac(1, 2*mu))), cex = labelsize)
Arrows(0.85, 0.73, 0.85, 0.89, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

dev.off()
