nSamples = 100000;asked = 16; SingnupA = 6; SingnupB = 10
# Priors 
priorA = rbeta(nSamples,10,20)
priorB = rbeta(nSamples,10,20)
# Simulate generative model (likelihood)
simSingnupA = rbinom(nSamples,asked,priorA)
simSingnupB = rbinom(nSamples,asked,priorB)
# Condition on observed data
ind = ( (simSingnupA==SingnupA) & (simSingnupB==SingnupB) )
margPosteriorA = priorA[ind]
margPosteriorB = priorB[ind]
# evaluate results
plot(margPosteriorA,margPosteriorB,cex=1,pch=16,xlim=c(0,1),ylim=c(0,1))
abline(0,1)