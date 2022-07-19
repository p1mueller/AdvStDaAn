source("../SpecificRfunctions/RFn_Plot-lmSim.R")
par(mfrow=c(2,4)) # Create figure with 2 vertical and 4 horziontal plots
plot(data.lm)
plot.lmSim(data.lm, SEED=1798)