#Graph Designer: Simon Halliday & Madeleine Wettach '20
#Authors: Bowles, Foley and Halliday
#Title: Coordination, Conflict and Competition: A Text in Microeconomics

require(shape)
pdf(file = "coordination_failures/step_by_step_graphs_6/coord_brfs_utilities_step1.pdf", width = 9, height = 7)

#Set parameters for graphics
axislabelsize <- 1.5
graphlinewidth <- 3
segmentlinewidth <- 2

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#4eb3d3", "#2b8cbe", "#0868ac","#084081")

par(mar =  c(6, 4, 4, 4))

uA <- function(ea, eb, alpha = 16, beta = 1/24) {
  alpha*(1 - beta*eb)*ea - 0.5*(ea)^2
}

uB <- function(ea, eb, alpha = 16, beta = 1/24) {
  alpha*(1 - beta*ea)*eb - 0.5*(eb)^2
}

brfB <- function(ea, alpha = 16, beta = 1/24) {
  alpha*(1 - beta*ea)
}

brfA <- function(ea, alpha = 16, beta = 1/24) {
  (alpha - ea)/(alpha * beta)
}

brfPE <- function(ea, alpha = 16, beta = 1/12) {
  alpha*(1 - beta*ea)
}

indiffeA <- function(ea, alpha = 16, beta = 1/24, uA = 46.08) {
  1/beta - (0.5*ea)/(alpha*beta) - uA/(alpha*beta*ea)
}

indiffB <- function(eb, alpha = 16, beta = 1/24, uB = 46.08) {
  (alpha*eb - uB - 0.5*eb^2)/(alpha*beta*eb)
}

indiffB2 <- function(ea, alpha = 16, beta = 1/24, uB = 46.08) {
  sqrt(alpha^2*(beta*ea - 1)^2 - 2*uB) - alpha*beta*ea + alpha
}

indiffB3 <- function(ea, alpha = 16, beta = 1/24, uB = 46.08) {
  -sqrt(alpha^2*(beta*ea - 1)^2 - 2*uB) - alpha*beta*ea + alpha
}


#Input into Wolfram Alpha: solve for x y = 1/b - (0.5*x)/(a*b) - u/(a*b*x)

# indiffAlowB <- function(eb, alpha = 16, beta = 1/24, uA = 46.08) {
#   0.5*(-sqrt((2*alpha*beta*eb - 2*alpha)^2 - 8*uA)) - 2*alpha*beta*eb + 2*alpha
# }
# 
# indiffAlow <- function(ea, alpha = 16, beta = 1/24, uA = 46.08) {
#   0.5*(-sqrt((2*alpha*beta*ea - 2*alpha)^2 - 8*uA)) - 2*alpha*beta*ea + 2*alpha
# }
# 
# indiffAgain <- function(ea, alpha = 16, beta = 1/24, uA = 46.08) {
#   (-2*alpha*ea +2*uA + ea^2 )/ ( 2 * alpha * beta * ea)
# }

xlims <- c(0, 18)
ylims <- c(0, 18)

npts <- 501 
x <- seq(xlims[1], xlims[2], length.out = npts)
y <- seq(ylims[1], ylims[2], length.out = npts) 
a <- c(46.08, 55, 64)
b <- c(46.08, 55, 64)


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

# ticksy <- seq(from = 0, to = ylims[2], by = 2)
# ylabels <- seq(from = 0, to = ylims[2], by = 2)
# ticksx <- seq(from = 0, to = xlims[2], by = 2)
# xlabels <- seq(from = 0, to = xlims[2], by = 2)
ticksy <- c(0, 7, 9.6, 16, 18)
ylabels <- c(NA, expression(paste(e^B,"*")), expression(paste(e^{BN})), expression(paste(alpha)), NA)
ticksx <- c(0, 7, 9.6, 16, 18)
xlabels <- c(NA, expression(paste(e^A,"*")), expression(paste(e^{AN})), expression(paste(alpha)), NA)


axis(1, at = ticksx, pos = 0, labels = xlabels)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)


#I need something like xx1 with npts for 
##xpoly1 <- seq(from = 4.1, to = 9.6, length.out = 500)
##ypoly1 <- indiffA(xpoly1, uA = 46.08, alpha = 16, beta = 1/24)
##ypoly2 <- indiffB3(xpoly1, uB = 46.08, alpha = 16, beta = 1/24)
##polygon(x = c(xpoly1, rev(xpoly1)), y = c(ypoly1, rev(ypoly2)), col=COL[4], density=NULL, border = NA)



lines(xx1, brfA(xx1, alpha = 16, beta = 1/24), col = COLA[4], lwd = graphlinewidth)
###lines(xx1, brfB(xx1, alpha = 16, beta = 1/24), col = COLB[4], lwd = graphlinewidth)
#lines(xx1, indiffA(xx1, alpha = 16, beta = 1/24, uA = 46.08), col = COL[2], lwd = graphlinewidth)
#lines(xx1, indiffB(xx1, alpha = 16, beta = 1/24, uB = 42), col = COL[2], lwd = graphlinewidth)
#lines(xx1, indiffB2(xx1, alpha = 16, beta = 1/24, uB = 46.08), col = COL[2], lwd = graphlinewidth)
#lines(xx1, indiffB3(xx1, alpha = 16, beta = 1/24, uB = 46.08), col = COL[2], lwd = graphlinewidth)
#lines(xx1, indiffAlow(xx1, uA = 42, alpha = 16, beta = 1/24), col = COL[2], lwd = graphlinewidth)
#lines(xx1, indiffAgain(xx1, uA = 42, alpha = 16, beta = 1/24), col = COL[2], lwd = graphlinewidth)


#persp(x, y, outer(x, y, u), ticktype="detailed") 
contour(y, x, 
        outer(x, y, uA),
        #labels = c("v1", "v2", "v3"),
        drawlabels = FALSE,
        col = COLA[3],
        #xlab = expression(paste("A's Apples, ", x)),
        #ylab = expression(paste("A's Oranges, ", y)),
        #cex.lab = axislabelsize,
        lwd = graphlinewidth,
        levels = a, 
        xaxs="i", 
        yaxs="i", 
        add = TRUE) 

mtext(expression(paste("A's effort,", e^A)), side=1, line = 2.5, cex = axislabelsize)
text(-1.5, 9, expression(paste("B's effort,", e^B)), xpd = TRUE, cex = axislabelsize, srt = 90) 

#Add arrows:
#arrows(-0.8, 10, -0.8, 14, xpd = TRUE, length=0.1,angle=40,lwd=3)
#arrows(6.2, -1.7, 9, -1.7, xpd = TRUE, length=0.1,angle=40,lwd=3)


#contour(x, y, 
#        outer(x, y, uB),
#        #labels = c("v1", "v2", "v3"),
#        drawlabels = FALSE,
#        col = COLB[2],
#        #xlab = expression(paste("")),
#        #ylab = expression(paste("")),
#        lwd = graphlinewidth,
#        levels = b, 
#        add = TRUE
#        #xaxs="i", 
#        #yaxs="i"
#) 


#segments(4.11765, 6.17647, 5.88, 8.88, lty = 1, col = COL[2] , lwd = graphlinewidth)
##text(7.3, 3, expression("Pareto Efficient"))
##text(7.3, 2.4, expression("Curve"))
##Arrows(7.3, 3.5, 7.3, 6.1, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

#Label the iso-welfare functions for the HG, Aisha
text(3.8, 1.5, expression(u[1]^A))
text(4.6, 1.5, expression(u[2]^A))
text(5.5, 1.5, expression(u[3]^A))
#text(6.6, 8.3, expression(u[4]^A))

#Label the indifference curves for the HG, Betty
##text(7.6, 17, expression(u[1]^B))
##text(6.75, 17, expression(u[2]^B))
##text(6, 17, expression(u[3]^B))
#text(3.4, 6.9, expression(v[4]^B))

#Label Nash Equilibrium 
##segments(0, 9.6, 9.6, 9.6, lty = 2, col = "gray" , lwd = segmentlinewidth)
##segments(9.6, 0, 9.6, 9.6, lty = 2, col = "gray" , lwd = segmentlinewidth)
##points(9.6, 9.6, pch = 16, col = "black", cex = 1.5)
##text(11.3, 10.1, expression(paste("Nash Equilibrium")))
##text(9.3, 9.3, expression(paste("n")))


#Annotate Pareto Efficient Curve and relevant points
##segments(8, 6, 6, 8, lty = 1, col = COL[2] , lwd = graphlinewidth)
##points(6, 8, pch = 16, col = "black", cex = 1.5)
##text(6, 8.5, expression(paste("g")))

##points(8, 6, pch = 16, col = "black", cex = 1.5)
##text(7, 7.5, expression(paste("i")))

##points(7, 7, pch = 16, col = "black", cex = 1.5)
##text(8, 6.5, expression(paste("f")))

#points(5.84, 8.77, pch = 16, col = "black", cex = 1.5)

#A's brf
##text(2, 17.5, expression(paste("B's best response")))
##text(2, 17, expression(paste("function")))
##Arrows(2, 16.5, 2, 15.5, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)

#B's brf
text(15.5, 4, expression(paste("A's best response")))
text(15.5, 3.5, expression(paste("function")))
Arrows(15.5, 3, 15.5, 1.5, col = "black", lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)


dev.off()
