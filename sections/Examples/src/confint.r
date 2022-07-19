# Applies Wald testing.
h <- summary(data.glm)$coefficients
for(k in 1:dim(h)[1]) print(h[k,1] + c(-1,1)*qnorm(0.975) * h[k,2]) 
# Applies deviance testing.
confint(data.glm)