library(gam)
data.gam <- gam::gam(Y ~ lo(x1, span=0.7) + lo(x2), data=data, bf.maxit=100)
summary(data.gam) # print model summary

# Plot response vs. variable
par(mfrow=c(1,2))
plot.Gam(EDS.gam, se=TRUE)