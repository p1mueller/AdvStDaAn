source("../SpecificRfunctions/RFn_Plot-glmSim.R")
par(mfrow=c(2,4)) # Create figure with 2 vertical and 4 horziontal plots
plot(data.glm)
plot.glmSim(data.glm, SEED=111)