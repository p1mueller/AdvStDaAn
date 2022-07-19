obs_x = c(3.4, -4.2, -0.7, -2.6, -1.6, -1.2, -2.2, -3.7, -0.9, -3.1)
obs_y = c(5.7,-0.1, 4.7, 2.7, 3.1, 2.3, 3.4, 1.0, 2.2, 1.5)
logPosterior = function(b0_, b1_, sigma_){
   sum(dnorm(b0_+b1_*obs_x - obs_y, 0, sigma_, log=TRUE)) +
    dnorm(b0_, 0, 3, log=TRUE) +
    dnorm(b1_, 0, 3, log=TRUE) +
    dgamma(sigma_, 1, 1, log=TRUE)
}
b0 = runif(1,0,1)
b1 = runif(1,0,1)
sigma = runif(1,0,1)
b0_sample = c()
b1_sample = c()
sigma_sample = c()
# Bayesian Data Analysis via MCMC
for(i in 1:10000) {
    b0_prop = rnorm(1, b0, 0.3)
    b1_prop = rnorm(1, b1, 0.3)
    s_prop = abs(rnorm(1, sigma, 0.3))
    R = exp(logPosterior(b0_prop, b1_prop, s_prop)-logPosterior(b0, b1, sigma))
    u = runif(1)
    if( u <  R)
    {
        b0 = b0_prop
        b1 = b1_prop
        sigma = s_prop
    }
    b0_sample = c(b0_sample,b0)
    b1_sample = c(b1_sample,b1)
    sigma_sample = c(sigma_sample,sigma)
}
# Evaluation
plot(b0_sample, main='Traceplot b0')
plot(b1_sample, main='Traceplot b1')
plot(sigma_sample, main='Traceplot sigma')
plot(b0_sample,b1_sample, main='Scatterplot b0 against b1')
# Thinning the chains to get iid samples
b0_iid = b0_sample[1:100*100]
b1_iid = b1_sample[1:100*100]
sigma_iid = sigma_sample[1:100*100]