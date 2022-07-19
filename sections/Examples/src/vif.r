library(car)
vif(data.lm)
# If any VIF greater than 10 => Problem with colinearity