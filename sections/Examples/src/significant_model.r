data.fit1 <- glm(Y ~ ., family=binomial, data)
s <- summary(baby.fit1)
1 - pchisq(s$null.deviance - s$deviance, s$df.null - s$df.residual)
# Equivalent
data.fit0 <- glm(Y ~ 1, family=binomial, data)
anova(data.fit1, data.fit0, test="Chisq")
# If p-Value <5% the Nullhypthesis can be rejected