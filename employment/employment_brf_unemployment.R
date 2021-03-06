require(shape)
pdf(file = "employment/employment_brf_unemployment.pdf", width = 9, height = 7)

#Set parameters for graphics
axislabelsize <- 1.5
labelsize <- 1.1
graphlinewidth <- 2.5
segmentlinewidth <- 2

#The equation is below when v = 0. See Wolfram Alpha output. 
isov <- function(w, delta = 5) {
}

isovhigh1 <- function(w, delta = 5, v = 5){
  (sqrt(w^2 - 4 * delta * v) - w + 2*v)/( 2 * v )
}

isovlow1 <- function(w, delta = 5, v = 5){
  (-sqrt(w^2 - 4 * delta * v) - w + 2*v)/( 2 * v )
}

isovhigh2 <- function(w, delta = 5, v = 15){
  (sqrt(w^2 - 4 * delta * v) - w + 2*v)/( 2 * v )
}

isovlow2 <- function(w, delta = 5, v = 15){
  (-sqrt(w^2 - 4 * delta * v) - w + 2*v)/( 2 * v )
}

isovhigh3 <- function(w, delta = 5, v = 20){
  (sqrt(w^2 - 4 * delta * v) - w + 2*v)/( 2 * v )
}

isovlow3 <- function(w, delta = 5, v = 20){
  (-sqrt(w^2 - 4 * delta * v) - w + 2*v)/( 2 * v )
}

brfFn <- function(w, s = 0.1, B = 1, alpha = 0.5) {
  1 - (alpha / (w*s - B + alpha))
}

#This is evaluated for p = 12; q = 12/(8*sqrt(12^2 - 4*delta1*v1)) - 1/8 for the slope
#At p = 12; q = (-sqrt(12^2 - 4*v1*delta1) - 12 + 2*v1)/(2*v1) = 0.799
tangencyLine <- function(w){
  (w*(0.05))
}

solowCondition <- function(w, delta = 5){
  (w*(1/(8*delta)))
}

# solowCondition <- function(w, s = 0.1, B = 1, alpha = 0.5){
#   w * s*(0.5)*(alpha^0.5)*(1/(w*s - B + alpha))^(-0.5)
# }

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#4eb3d3", "#2b8cbe", "#0868ac","#084081")

par(mar =  c(5, 5, 4, 2))
xlims <- c(0, 50)
ylims <- c(0, 1)

plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")), 
     xaxt = "n", 
     yaxt = "n", 
     cex.lab = axislabelsize, 
     bty = "n",
     xaxs="i", 
     yaxs="i")


npts <- 500 
npts2 <- 501
#Customize ticks and labels for the plot
ticksy <- c(0, brfFn(w = 18.4), brfFn(w = 38, s = 0.045), 1)
ylabels <- c(0, expression(paste(e^{NH})), expression(paste(e^{NL})), 1)
ticksx <- c(0, 10, 18.4, 22.2, 38, 50)
xlabels <- c(0, expression(paste(w == B/s^{H})), expression(paste(w^{NH})), expression(paste(w == B/s^{L})),expression(paste(w^{NL})), NA)

axis(1, at = ticksx, pos = 0, labels = xlabels)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1)

mtext(expression(paste("Wage, ", w)), side=1, line = 2.5, cex = axislabelsize)
text(-4, 0.5*ylims[2], expression(paste("Employee's effort, ", e)), xpd = TRUE, cex = axislabelsize, srt = 90) 


#Specify the sequences of points for graphing. 
xx0 <- seq(5, xlims[2], length.out = npts)
xx1 <- seq(10, xlims[2], length.out = npts)
xx2 <- seq(5, 15, length.out = npts)
xx3 <- seq(10, xlims[2], length.out = npts2)
xx4 <- seq(xlims[1], 10, length.out = npts2)

#For below, I solved sqrt(p^2 - 200) - p + 200/p = 0, getting p = 10*sqrt(2) = 14.14214
xx5 <- seq( 18.43909, xlims[2], length.out = npts2)
xx6 <- seq( 18.43909, 25, length.out = npts2)
xx7 <- seq(20, xlims[2], length.out = npts2)
xx8 <- seq(xlims[1], 25, length.out = npts2)
xx10 <- seq(xlims[1], xlims[2], length.out = npts2)

#Draw the lines for the graphs
#lines(xx0, isov(xx0, delta = 5), col = COL[3], lwd = graphlinewidth)
lines(xx1, brfFn(xx1), col = "#beaed4", lwd = 4)
lines(xx7, brfFn(xx7, s = 0.045), col = "#beaed4", lwd = 4)
lines(xx10, solowCondition(xx10, delta = 3.63), col = COL[3], lwd = graphlinewidth)
lines(xx10, solowCondition(xx10, delta = 8), col = COL[3], lwd = graphlinewidth)


#Annotation of the three graphs and the NE
text(20, 0.85, expression(paste("Slope: ", frac(e^H, w^H) == frac(1, mu^H))))
text(40, 0.72, expression(paste("Slope: ", frac(e^{L}, w^{L}) == frac(1, mu^{L}))))

#text(35, 0.62, expression(paste("BRF: q = ", 1 - frac(2*delta, p))))
#text(3.9, 0.05, expression(paste(v[0],  " = z")))
#text(9.5, 0.05, expression(paste(v[1])))
# text(22, 0.05, expression(paste(v[1])))
# text(24.8, 0.05, expression(paste(v[2])))
# text(35, 0.66, expression(paste("Employee's ICC, or")))
text(44, 0.62, expression(paste("BRF")))
text(44, 0.58, expression(paste(("low unemployment"))))

text(44, 0.96, expression(paste("BRF")))
text(44, 0.92, expression(paste(("high unemployment"))))

# text(36, 0.94, expression(paste("Employee's PC")))
# text(36, 0.9, expression(paste(v == z)))


#Lines for the coordinates of the Nash equilbrium
#segments(5, 0, 5, 1, lty = 2, col = "darkgray", lwd = 3)
#segments(10, 0, 10, 0.2, lty = 2, col = "darkgray", lwd = 2)
#segments(20, 0, 20, 0.75, lty = 2, col = "darkgray", lwd = 2)
segments(0, brfFn(w = 38, s = 0.045), 38, brfFn(w = 38, s = 0.045), lty = 2, col = "darkgray", lwd = 2)
segments(38, 0, 38, brfFn(w = 38, s = 0.045), lty = 2, col = "darkgray", lwd = 2)
#segments(14.14214, 0.15, 14.14214, 0.45, lty = 2, col = "darkgray", lwd = 3)
text(38, brfFn(w = 38, s = 0.045)  + 0.04, expression(n^L))
# text(24.5, 0.48, expression(paste("Incomplete Contract")))
# text(24.5, 0.43, expression(paste("Nash equilibrium")))

#Arrows and rent label
# Arrows(15, 0.8, 19.3, 0.8,  col = "black", lty = 1, lwd = 2, arr.type = "triangle")
# Arrows(15, 0.8, 10.8, 0.8,  col = "black", lty = 1, lwd = 2, arr.type = "triangle")
# text(14.8, 0.95, expression(paste("Rent at")))
# text(14.8, 0.9, expression(paste("Incomplete Contract")))
# text(14.8, 0.85, expression(paste("Nash Equilibrium")))

#Arrows and slope of iso-v label
# Arrows(29, 0.15, 24, 0.15,  col = "black", lty = 1, lwd = 2, arr.type = "triangle")
# text(32, 0.2, expression(paste("Slope of iso-v")))
# text(32.3, 0.15, expression(paste(" = -mrs ")))
# text(32, 0.08, expression(paste(" = " -frac(v[w], v[e]))))

points(38, brfFn(w = 38, s = 0.045), pch = 16, col = "black", cex = 1.5)

#Add a point for the NE
#points(20, 0.5, pch = 16, col = "black", cex = 1.5)

segments(18.4, 0, 18.4, brfFn(w = 18.4), lty = 2, col = "darkgray", lwd = 2)
segments(0, brfFn(w = 18.4), 18.4, brfFn(w = 18.4), lty = 2, col = "darkgray", lwd = 2)
points(18.4, brfFn(w = 18.4), pch = 16, col = "black", cex = 1.5)
text(18, brfFn(w = 18.4)  + 0.04, expression(n^H))

# points(22, isovhigh3(22, v = 20, delta = 5), pch = 16, col = "black", cex = 1.5)
# text(22 + 0.5, isovhigh3(22, v = 20, delta = 5) - 0.02, expression(f))
# points(22, isovlow3(22, v = 20, delta = 5), pch = 16, col = "black", cex = 1.5)
# text(22 + 0.5, isovlow3(22, v = 20, delta = 5) + 0.02, expression(b))

#Add a point for f. referred to in the text
#points(12, 0.82, pch = 16, col = "black", cex = 1.2)
#text(12, 0.85, expression(paste("NE")))

#Arrow to Pareto-improving Lens
#Arrows(20, 0.8, 23.8, 0.68, col = "black", lty = 1, lwd = 3)
#text(20, 0.82, expression(paste("Pareto-Improving Lens")))

dev.off()