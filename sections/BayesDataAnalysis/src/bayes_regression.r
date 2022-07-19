# Observed data:
obs_x = runif(12,0,10)
obs_y = 2 + 3 * obs_x + rnorm(12,mean=0,sd=1)
# Log of (unnormalized) posterior density
logPosterior = function(b0_, b1_, sigma_){
    sum(dnorm(b0_+b1_*obs_x - obs_y, 0, sigma_, log=T))
}
# Starting value
b0 = runif(1,0,1)
b1 = runif(1,0,1)
sigma = runif(1,0,1)
# Collect sample
b0_sample = c()
b1_sample = c()
sigma_sample = c()
# Bayesian Data Analysis via MCMC
for(i in 1:10000) {
    b0_prop = rnorm(1,b0,0.1)
    b1_prop = rnorm(1,b1,0.1)
    s_prop = abs(rnorm(1,sigma,0.1))
    R = exp(logPosterior(b0_prop, b1_prop, s_prop)-logPosterior(b0, b1,
    sigma))
    u = runif(1,0,1)
    if( u < R) {
        b0 = b0_prop
        b1 = b1_prop
        sigma = s_prop
    }
    b0_sample = c(b0_sample,b0)
    b1_sample = c(b1_sample,b1)
    sigma_sample = c(sigma_sample,sigma)
}