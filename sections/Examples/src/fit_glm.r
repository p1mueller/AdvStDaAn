data.glm <- glm(
    cbind(Y, m-Y) ~ x1 + x2, family=binomial(link=probit), data=data
)