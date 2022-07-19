data.glm <- glm(
    cbind(Y, m-Y) ~ x1 + x2, family=binomial(link=logit), data=data
)
# bad
h1 <- predict(data.glm, newdata=data_new, type="response", se=T)
h1$fit + c(-1,1) * qnorm(0.975)*h1$se.fit

## better
h2 <- predict(data.glm, newdata=data_new, type="link", se=T)
h2a <- h2$fit + c(-1,1)*qnorm(0.975)*h2$se.fit
1/(1 + exp(-h2a))

## optional:
## Since the object data.glm knows which family and which link is used we can
## do the calculation also in this way:
family(data.glm)$linkinv(h2$fit + c(-1,1)*qnorm(0.975)*h2$se.fit)