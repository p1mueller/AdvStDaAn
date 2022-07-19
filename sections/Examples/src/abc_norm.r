nSamples = 10000
prior = rnorm(nSamples, mean=325, sd=2)
observed = sum(310, 320, 324, 307, 329)
keep = rep(FALSE, nSamples)
for(i in 1:nSamples)
{
  simulatedValues = rnorm(5, mean=prior[i], sd=9)
  if(abs(sum(simulatedValues)-observed)<10){
      keep[i] = TRUE
  }
}
# condition on observed data
posterior = prior[keep]