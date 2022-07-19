s <- summary(data.glm)
1 - pchisq(s$deviance, s$df.residual) # if >0.05 => phi = 1
# or
qchisq(c(0.025,0.975), s$df.residual) # if deviance is inside of range => phi = 1
