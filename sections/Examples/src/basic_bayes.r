n_experiments = 10000; n_samples = 16; n_event = 6
prior = runif(n_experiments, 0, 1) # or other priors
hist(prior) # It's always good to eyeball the prior to make sure it looks ok
# Define the generative model:
generativemodel = function(theta)
{
    rbinom(1, n_samples, theta) # or other generative processes
} 
# Simulate data using parameters from the prior and the generative model:
simdata = rep(NA, n_experiments)
for(i in 1:n)
{
  simdata[i] = generativemodel( prior[i] )
} 
# Filter out all draws that do not match the data:
posterior = prior[simdata == n_event]
hist(posterior) # Eyeball the posterior
length(posterior) # Are there enought draws left after the filtering?
# There are no rules here, but you probably want to aim for >1000 draws.
mean(posterior)
quantile(posterior,c(.05,.95))